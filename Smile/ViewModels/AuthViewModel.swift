//
//  AuthViewModel.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation
import SwiftUI
import UIKit

class AuthViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var authError: String = ""
    private let dataService: DataService
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
//        print("AuthViewModel initialized")
    }
    
    var isAuthenticated: Bool {
        return currentUser != nil
    }
    
    @MainActor
    func signUp(email: String, password: String, username: String, firstName: String, lastName: String) {
        Task {
            do {
                let user = try await dataService.signUp(
                    email: email,
                    password: password,
                    username: username,
                    firstName: firstName,
                    lastName: lastName
                )
                currentUser = user
                authError = ""
            } catch {
                authError = error.localizedDescription
            }
        }
    }
    
    @MainActor
    func signIn(email: String, password: String) {
        Task {
            do {
//                print("Attempting to sign in with email: \(email)")
                let user = try await dataService.signIn(email: email, password: password)
//                print("Sign in successful. User: \(user)")
                currentUser = user
                authError = ""
            } catch {
                print("Sign in error: \(error.localizedDescription)")
                authError = error.localizedDescription
            }
        }
    }
    
    @MainActor
    func signOut() {
        Task {
            do {
                try await dataService.signOut()
                currentUser = nil
                authError = ""
            } catch {
                authError = error.localizedDescription
            }
        }
    }
    
    func updateProfileImage(_ image: UIImage, type: ProfileImageType) async throws {
        guard let currentUser = currentUser else { return }
        guard let imageData = type == .profilePicture ?
            image.jpegData(compressionQuality: 0.5) :
            image.jpegData(compressionQuality: 0.7) else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"])
        }
        
        let path = type == .profilePicture ?
            "profile_pictures/\(currentUser.id).jpg" :
            "profile_banners/\(currentUser.id).jpg"
        
        // First upload the image
        let imageUrl = try await dataService.uploadProfileImage(imageData, path: path)
        
        // Then update the user profile
        try await dataService.updateUserProfileImage(
            userId: currentUser.id,
            imageUrl: imageUrl.absoluteString,
            type: type
        )
        
        // Update the current user object with the new image URL
        await MainActor.run {
            var updatedUser = currentUser
            if type == .profilePicture {
                updatedUser.profilePictureUrl = imageUrl.absoluteString
            } else {
                updatedUser.bannerPictureUrl = imageUrl.absoluteString
            }
            self.currentUser = updatedUser
        }
    }
}
