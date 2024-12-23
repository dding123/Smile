//
//  ProfileLoading.swift
//  Smile
//
//  Created by David Ding on 12/22/24.
//
import SwiftUI
import Combine

@MainActor
protocol ProfileLoading: ObservableObject {
    var user: User? { get set }
    var uploadedPosts: [Post] { get set }
    var taggedPosts: [Post] { get set }
    var isLoading: Bool { get set }
    var error: String? { get set }
    
    var dataService: DataService { get }
    var userId: String { get }
    
    func loadProfile() async
    func loadUserPosts() async
}

@MainActor
extension ProfileLoading {
    func loadProfile() async {  // Added async keyword
        isLoading = true
        
        do {
            user = try await dataService.fetchUserProfile(userId: userId)
            await loadUserPosts()
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }

    func loadUserPosts() async {
        do {
            let uploaded = try await dataService.fetchUserPosts(userId: userId, limit: 12, after: nil)
            uploadedPosts = uploaded
            
            let tagged = try await dataService.fetchTaggedPosts(userId: userId, limit: 12, after: nil)
            taggedPosts = tagged
        } catch {
            self.error = error.localizedDescription
        }
    }
}
