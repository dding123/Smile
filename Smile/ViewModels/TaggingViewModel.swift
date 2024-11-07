//
//  TaggingViewModel.swift
//  Smile
//
//  Created by David Ding on 10/22/24.
//
import SwiftUI
import Firebase
import Combine

class TaggingViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchResults: [UserPreview] = []
    @Published var taggedUsers: [UserPreview] = []
    private let dataService: DataService
    private var searchTask: Task<Void, Never>?
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
        
        // Set up search functionality with debounce
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] text in
                if !text.isEmpty {
                    // Cancel any existing search task
                    self?.searchTask?.cancel()
                    
                    // Create a new search task
                    self?.searchTask = Task {
                        await self?.searchUsers(matching: text)
                    }
                } else {
                    Task { @MainActor in
                        self?.searchResults = []
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    @MainActor
    private func searchUsers(matching query: String) async {
        do {
            searchResults = try await dataService.searchUsers(matching: query)
        } catch {
            print("Error searching users: \(error)")
            searchResults = []
        }
    }
    
    func tagUser(_ user: UserPreview) {
        if !taggedUsers.contains(user) {
            taggedUsers.append(user)
        }
    }
    
    func removeTag(_ user: UserPreview) {
        taggedUsers.removeAll { $0.id == user.id }
    }
}
