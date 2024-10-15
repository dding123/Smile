//
//  HomeViewModel.swift
//  Smile
//
//  Created by David Ding on 10/14/24.
//

import SwiftUI
import Firebase
import Combine

class HomeViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private var cancellables = Set<AnyCancellable>()
    private let dataService = FirebaseDataService()

    func fetchPosts() {
        dataService.fetchPosts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching posts: \(error)")
                }
            }, receiveValue: { [weak self] posts in
                self?.posts = posts
            })
            .store(in: &cancellables)
    }
}
