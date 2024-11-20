//
//  BaseProfileViewModel.swift
//  Smile
//
//  Created by David Ding on 11/10/24.
//
import SwiftUI
import Firebase
import Combine

class BaseProfileViewModel: ObservableObject {
    enum Tab {
        case photos
        case uploads
    }
    
    // Change from private to protected
    internal var userId: String {
        didSet {
            if oldValue != userId {
                Task { @MainActor in
                    await loadProfile()
                }
            }
        }
    }
    
    @Published var uploadedPosts: [Post] = []
    @Published var taggedPosts: [Post] = []
    @Published var isLoading = false
    @Published var error: String?
    @Published var user: User?
    
    private let dataService: DataService
    private var lastUploadedPost: Post?
    private var lastTaggedPost: Post?
    private var hasMoreUploadedPosts = true
    private var hasMoreTaggedPosts = true
    
    init(userId: String) {
        self.userId = userId
        self.dataService = FirebaseDataService()
    }
    
    @MainActor
    func loadProfile() async {
        isLoading = true
        do {
//            print("Loading profile for userId: \(userId)") // Debug print
            user = try await dataService.fetchUserProfile(userId: userId)
//            print("Loaded user: \(String(describing: user))") // Debug print
            await loadUserPosts()
        } catch {
            print("Error loading profile: \(error)")
            self.error = error.localizedDescription
        }
        isLoading = false
    }
    
    @MainActor
    private func loadUserPosts() async {
        isLoading = true
        do {
            let uploaded = try await dataService.fetchUserPosts(
                userId: userId,
                limit: 12,
                after: nil
            )
            uploadedPosts = uploaded
            lastUploadedPost = uploaded.last
            hasMoreUploadedPosts = uploaded.count == 12
            
            let tagged = try await dataService.fetchTaggedPosts(
                userId: userId,
                limit: 12,
                after: nil
            )
            taggedPosts = tagged
            lastTaggedPost = tagged.last
            hasMoreTaggedPosts = tagged.count == 12
        } catch let loadError {
            error = loadError.localizedDescription
        }
        isLoading = false
    }
}
