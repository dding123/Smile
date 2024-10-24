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
    private var cancellables = Set<AnyCancellable>()
    private let dataService: DataService
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
        
        print("TaggingViewModel initialized")
        
        // Debounce search text changes
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] text in
                if !text.isEmpty {
                    self?.searchUsers(matching: text)
                } else {
                    self?.searchResults = []
                }
            }
            .store(in: &cancellables)
    }
    
    func searchUsers(matching query: String) {
        print("Searching for users matching: \(query)") // Debug print

        dataService.searchUsers(matching: query)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error searching users: \(error)")
                }
            }, receiveValue: { [weak self] users in
                print("Found \(users.count) users") // Debug print
                self?.searchResults = users
            })
            .store(in: &cancellables)
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
