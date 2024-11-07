//
//  ProfileViewModel.swift
//  Smile
//
//  Created by David Ding on 10/27/24.
//

import SwiftUI
import Firebase
import Combine

class ProfileViewModel: ObservableObject {
    @Published var uploadedPosts: [Post] = []
    @Published var taggedPosts: [Post] = []
    @Published var isLoading = false
    @Published var error: String?
    
    private let dataService: DataService
    private let userId: String
    private var lastUploadedPost: Post?
    private var lastTaggedPost: Post?
    private var hasMoreUploadedPosts = true
    private var hasMoreTaggedPosts = true
    
    init(dataService: DataService = FirebaseDataService(), userId: String) {
        self.dataService = dataService
        self.userId = userId
        Task {
            await fetchInitialPosts()
        }
    }
    
    @MainActor
    func fetchInitialPosts() async {
        isLoading = true
        do {
//            // Reset everything for fresh load
//            uploadedPosts = []
//            taggedPosts = []
//            lastUploadedPost = nil
//            lastTaggedPost = nil
//            hasMoreUploadedPosts = true
//            hasMoreTaggedPosts = true
            
            // Fetch initial batch of posts with nil for 'after' parameter
            let uploaded = try await dataService.fetchUserPosts(
                userId: userId,
                limit: 12,
                after: nil
            )
            
//            print("Fetched \(uploaded.count) uploaded posts") // Add debug print
            uploadedPosts = uploaded
            lastUploadedPost = uploaded.last
            hasMoreUploadedPosts = uploaded.count == 12
            
            let tagged = try await dataService.fetchTaggedPosts(
                userId: userId,
                limit: 12,
                after: nil
            )
//            print("Fetched \(tagged.count) tagged posts") // Add debug print
            taggedPosts = tagged
            lastTaggedPost = tagged.last
            hasMoreTaggedPosts = tagged.count == 12
            
        } catch {
            print("Error fetching posts: \(error)") // Add debug print
            self.error = error.localizedDescription
        }
        isLoading = false
    }
    
    @MainActor
    func loadMorePosts(forTab tab: ProfileView.Tab) async {
        guard !isLoading else { return }
        
        if tab == .uploads && !hasMoreUploadedPosts { return }
        if tab == .photos && !hasMoreTaggedPosts { return }
        
        isLoading = true
        do {
            if tab == .uploads {
                let newPosts = try await dataService.fetchUserPosts(
                    userId: userId,
                    limit: 12,
                    after: lastUploadedPost
                )
                uploadedPosts.append(contentsOf: newPosts)
                lastUploadedPost = newPosts.last
                hasMoreUploadedPosts = newPosts.count == 12
            } else {
                let newPosts = try await dataService.fetchTaggedPosts(
                    userId: userId,
                    limit: 12,
                    after: lastTaggedPost
                )
                taggedPosts.append(contentsOf: newPosts)
                lastTaggedPost = newPosts.last
                hasMoreTaggedPosts = newPosts.count == 12
            }
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
}
