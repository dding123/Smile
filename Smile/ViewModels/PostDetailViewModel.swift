//
//  PostDetailViewModel.swift
//  Smile
//
//  Created by David Ding on 10/28/24.
//
import SwiftUI
import Firebase
import Combine

class PostDetailViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    @Published var likeCount: Int = 0
    @Published var isLiked: Bool = false
    @Published var isCommentingActive: Bool = false
    @Published var newCommentText: String = ""
    @Published var userProfilePicture: String?
    
    private let post: Post
    private let dataService: DataService
    
    init(post: Post, dataService: DataService = FirebaseDataService()) {
        self.post = post
        self.dataService = dataService
        
        Task {
            await fetchComments()
            await fetchLikeStatus()
            await fetchUserProfile()
        }
    }
    
    @MainActor
    func fetchComments() async {
        do {
            comments = try await dataService.fetchComments(for: post.uniqueId)
        } catch {
            print("Error fetching comments: \(error)")
        }
    }
    
    @MainActor
    func fetchLikeStatus() async {
        guard let postId = post.id, !postId.isEmpty else {
            print("Warning: Invalid post ID in fetchLikeStatus")
            isLiked = false
            likeCount = 0
            return
        }
        
        do {
            let status = try await dataService.fetchLikeStatus(for: postId)
            isLiked = status.isLiked
            likeCount = status.count
        } catch {
            print("Error fetching like status: \(error)")
            isLiked = false
            likeCount = 0
        }
    }
    
    @MainActor
    func fetchUserProfile() async {
        do {
            let profile = try await dataService.fetchUserProfile(userId: post.userId)
            userProfilePicture = profile.profilePictureUrl
        } catch {
            print("Error fetching user profile: \(error)")
        }
    }
    
    @MainActor
    func toggleLike() {
           guard let postId = post.id, !postId.isEmpty else {
               print("Warning: Invalid post ID in toggleLike")
               return
           }
           
           Task {
               do {
                   isLiked.toggle()
                   if isLiked {
                       likeCount += 1
                   } else {
                       likeCount -= 1
                   }
                   
                   try await dataService.toggleLike(for: postId)
               } catch {
                   // Revert on failure
                   isLiked.toggle()
                   likeCount += isLiked ? 1 : -1
                   print("Error toggling like: \(error)")
               }
           }
       }
    
    @MainActor
    func addComment() async {
        guard !newCommentText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        do {
            try await dataService.addComment(to: post.uniqueId, text: newCommentText)
            newCommentText = ""
            await fetchComments()
        } catch {
            print("Error adding comment: \(error)")
        }
    }
}
