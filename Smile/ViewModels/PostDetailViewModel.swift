//
//  PostDetailViewModel.swift
//  Smile
//
//  Created by David Ding on 10/28/24.
//
import SwiftUI
import Combine
import FirebaseAuth

@MainActor
class PostDetailViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    @Published var likeCount: Int = 0
    @Published var isLiked: Bool = false
    @Published var isCommentingActive: Bool = false
    @Published var newCommentText: String = ""
    @Published var userProfilePicture: String?
    @Published var userProfilePictures: [String: String] = [:]
    @Published var showDeleteConfirmation = false
    @Published var isDeleting = false
    
    private let post: Post
    private let dataService: DataService
    var onPostDeleted: (() -> Void)?
    
    init(post: Post, dataService: DataService = FirebaseDataService()) {
        self.post = post
        self.dataService = dataService
        
        Task {
            await fetchComments()
            await fetchLikeStatus()
            await fetchUserProfile()
        }
    }
    
    func deletePost() async {
        guard let postId = post.id else { return }
        isDeleting = true
        
        do {
            try await dataService.deletePost(postId)
            onPostDeleted?()
            isDeleting = false
        } catch {
            print("Error deleting post: \(error)")
            isDeleting = false
        }
    }
    
    func fetchComments() async {
        do {
            comments = try await dataService.fetchComments(for: post.uniqueId)
            
            // Fetch profile pictures for all commenters
            for comment in comments {
                if userProfilePictures[comment.userId] == nil {
                    do {
                        let user = try await dataService.fetchUserProfile(userId: comment.userId)
                        await MainActor.run {
                            userProfilePictures[comment.userId] = user.profilePictureUrl
                        }
                    } catch {
                        print("Error fetching profile picture for user \(comment.userId): \(error)")
                    }
                }
            }
        } catch {
            print("Error fetching comments: \(error)")
        }
    }
    
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
    
    func fetchUserProfile() async {
        do {
            let profile = try await dataService.fetchUserProfile(userId: post.userId)
            userProfilePicture = profile.profilePictureUrl
        } catch {
            print("Error fetching user profile: \(error)")
        }
    }
    
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
