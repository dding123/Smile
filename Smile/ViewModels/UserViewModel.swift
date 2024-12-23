//
//  UserViewModel.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation

@MainActor
class UserViewModel: ProfileLoading {
    @Published var user: User?
    @Published var uploadedPosts: [Post] = []
    @Published var taggedPosts: [Post] = []
    @Published var isLoading = false
    @Published var error: String?
    @Published var isFollowing = false
    
    let dataService: DataService
    let userId: String
    
    init(userId: String, dataService: DataService = FirebaseDataService()) {
        self.userId = userId
        self.dataService = dataService
        loadProfile()
    }
    
    func toggleFollow() {
        // Implement follow/unfollow logic here
        isFollowing.toggle()
    }
    
    func sendMessage() {
        // Implement message sending logic here
    }
}
