//
//  AuthViewModel.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation
import Combine
import UIKit

class AuthViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var authError: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let dataService: DataService
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
        print("AuthViewModel initialized")
    }
    
    var isAuthenticated: Bool {
        return currentUser != nil
    }
    
    func signUp(email: String, password: String, username: String, firstName: String, lastName: String) {
        dataService.signUp(email: email, password: password, username: username, firstName: firstName, lastName: lastName)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.authError = error.localizedDescription
                }
            }, receiveValue: { [weak self] user in
                self?.currentUser = user
                self?.authError = ""
            })
            .store(in: &cancellables)
    }
    
    func signIn(email: String, password: String) {
        print("Attempting to sign in with email: \(email)")
        dataService.signIn(email: email, password: password)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    print("Sign in process completed")
                case .failure(let error):
                    print("Sign in error: \(error.localizedDescription)")
                    self?.authError = error.localizedDescription
                }
            }, receiveValue: { [weak self] user in
                print("Sign in successful. User: \(user)")
                self?.currentUser = user
                self?.authError = ""
            })
            .store(in: &cancellables)
    }
    
    func signOut() {
        dataService.signOut()
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.authError = error.localizedDescription
                }
            }, receiveValue: { [weak self] _ in
                self?.currentUser = nil
                self?.authError = ""
            })
            .store(in: &cancellables)
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
