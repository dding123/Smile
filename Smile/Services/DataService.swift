//
//  DataService.swift
//  Smile
//
//  Created by David Ding on 9/18/24.
//

import Foundation
import Combine

protocol DataService {
    // Auth
    func signIn(email: String, password: String) async throws -> User
    func signUp(email: String, password: String, username: String, firstName: String, lastName: String) async throws -> User
    func signOut() async throws
    
    // Posts and Images
    func uploadImage(_ data: Data) async throws -> String
    func createPost(userId: String, username: String, imagePath: String, caption: String, taggedUsers: [String]) async throws
    func searchUsers(matching query: String) async throws -> [UserPreview]
    
    // Profile
    func uploadProfileImage(_ data: Data, path: String) async throws -> URL
    func updateUserProfileImage(userId: String, imageUrl: String, type: ProfileImageType) async throws
    func fetchUserProfile(userId: String) async throws -> User
    
    // Fetch Posts
    func fetchUserPosts(userId: String, limit: Int, after post: Post?) async throws -> [Post]
    func fetchTaggedPosts(userId: String, limit: Int, after post: Post?) async throws -> [Post]
    
    // Comments
    func fetchComments(for postId: String) async throws -> [Comment]
    func addComment(to postId: String, text: String) async throws
    
    // Likes
    func fetchLikeStatus(for postId: String) async throws -> LikeStatus
    func toggleLike(for postId: String) async throws
    
    // User
//    func fetchUser(userId: String) async throws -> User
    
    func fetchUserGroups() async throws -> [UserGroup]
    func createGroup(name: String) async throws -> UserGroup  // Remove photo parameter
//    func joinGroup(groupId: String) async throws
//    func leaveGroup(groupId: String) async throws
}
