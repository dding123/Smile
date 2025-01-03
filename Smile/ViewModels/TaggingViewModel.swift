//
//  TaggingViewModel.swift
//  Smile
//
//  Created by David Ding on 10/22/24.
//
import SwiftUI
import Firebase
import FirebaseAuth
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
                guard let self = self else { return }
                self.searchTask?.cancel()
                
                if text.isEmpty {
                    Task { @MainActor in
                        self.searchResults = []  // Ensure results are cleared when search is empty
                    }
                    return
                }
                
                self.searchTask = Task {
                    await self.searchUsers(matching: text)
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
        // Prevent tagging yourself
        guard user.id != Auth.auth().currentUser?.uid else { return }
        
        if !taggedUsers.contains(user) {
            taggedUsers.append(user)
        }
    }
    
    func removeTag(_ user: UserPreview) {
        taggedUsers.removeAll { $0.id == user.id }
    }
}
