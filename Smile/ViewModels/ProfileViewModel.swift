//
//  ProfileViewModel.swift
//  Smile
//
//  Created by David Ding on 10/27/24.
//

import SwiftUI
import Firebase
import Combine

@MainActor
class ProfileViewModel: ProfileLoading {
    @Published var user: User?
    @Published var uploadedPosts: [Post] = []
    @Published var taggedPosts: [Post] = []
    @Published var isLoading = false
    @Published var error: String?
    @Published var isImagePickerShowing = false
    @Published var profileImageType: ProfileImageType = .profilePicture
    @Published var showingSettingsSheet = false
    
    let dataService: DataService
    var userId: String { authViewModel.currentUser?.id ?? "" }
    
    private var authViewModel: AuthViewModel
    
    init(authViewModel: AuthViewModel, dataService: DataService = FirebaseDataService()) {
        self.authViewModel = authViewModel
        self.dataService = dataService
        loadProfile()
    }
    
    func updateAuthViewModel(_ newAuthViewModel: AuthViewModel) {
        self.authViewModel = newAuthViewModel
        if authViewModel.currentUser != nil {
            loadProfile()
        }
    }
    
    func updateProfileImage(_ image: UIImage, type: ProfileImageType) async {
        do {
            try await authViewModel.updateProfileImage(image, type: type)
            await loadUserPosts()
        } catch {
            self.error = error.localizedDescription
        }
    }
    
    func signOut() async {
        await authViewModel.signOut()
    }
}
    // Future methods could include:
    // - updateProfile(firstName:lastName:bio:)
    // - updatePrivacySettings
    // - updateNotificationPreferences
    // - deleteAccount
    // - blockUser
    // - etc.

