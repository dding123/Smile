//
//  ProfileViewModel.swift
//  Smile
//
//  Created by David Ding on 10/27/24.
//

import SwiftUI
import Firebase
import Combine

class ProfileViewModel: BaseProfileViewModel {
    private var authViewModel: AuthViewModel
    @Published var isImagePickerShowing = false
    @Published var profileImageType: ProfileImageType = .profilePicture
    @Published var showingSettingsSheet = false
    
    init(authViewModel: AuthViewModel) {
        self.authViewModel = authViewModel
        super.init(userId: authViewModel.currentUser?.id ?? "")
    }
    
    func updateAuthViewModel(_ newAuthViewModel: AuthViewModel) {
        self.authViewModel = newAuthViewModel
        if let userId = newAuthViewModel.currentUser?.id {
            self.userId = userId
            Task {
                await loadProfile()
            }
        }
    }
    
    func signOut() async {
        await authViewModel.signOut()
    }
    
    func updateProfileImage(_ image: UIImage, type: ProfileImageType) async {
        do {
            try await authViewModel.updateProfileImage(image, type: type)
            await loadProfile() // Reload profile to show updated image
        } catch {
            print("Error updating profile image: \(error)")
        }
    }
    
    // Future methods could include:
    // - updateProfile(firstName:lastName:bio:)
    // - updatePrivacySettings
    // - updateNotificationPreferences
    // - deleteAccount
    // - blockUser
    // - etc.
}
