//
//  SearchViewModel.swift
//  Smile
//
//  Created by David Ding on 11/9/24.
//

import SwiftUI
import Combine
import FirebaseAuth

@MainActor
class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchResults: [UserPreview] = []
    private var searchTask: Task<Void, Never>?
    private let dataService: DataService
    private var cancellables = Set<AnyCancellable>()
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
        setupSearchSubscription()
    }
    
    private func setupSearchSubscription() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] text in
                guard let self = self else { return }
                self.searchTask?.cancel()
                
                guard !text.isEmpty else {
                    self.searchResults = []
                    return
                }
                
                self.searchTask = Task {
                    do {
                        let results = try await self.dataService.searchUsers(matching: text)
                        if !Task.isCancelled {
                            self.searchResults = results
                        }
                    } catch {
                        print("Search error: \(error)")
                    }
                }
            }
            .store(in: &cancellables)
    }
}
