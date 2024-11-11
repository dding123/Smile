//
//  ProfileView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var viewModel: ProfileViewModel
    
    init() {
        // This temporary AuthViewModel will be replaced in onAppear
        self._viewModel = StateObject(wrappedValue: ProfileViewModel(authViewModel: AuthViewModel()))
    }
    
    var body: some View {
        BaseProfileView(userId: authViewModel.currentUser?.id ?? "", viewModel: viewModel) {
            VStack(spacing: 12) {
                Button {
                    viewModel.profileImageType = .profilePicture
                    viewModel.isImagePickerShowing = true
                } label: {
                    Label("Change Profile Picture", systemImage: "camera")
                        .foregroundColor(.blue)
                }
                
                Button {
                    viewModel.profileImageType = .bannerPicture
                    viewModel.isImagePickerShowing = true
                } label: {
                    Label("Change Banner Picture", systemImage: "photo")
                        .foregroundColor(.blue)
                }
                
                Button {
                    viewModel.showingSettingsSheet = true
                } label: {
                    Label("Settings", systemImage: "gear")
                        .foregroundColor(.blue)
                }
                
                Button {
                    Task {
                        await viewModel.signOut()
                    }
                } label: {
                    Label("Sign Out", systemImage: "rectangle.portrait.and.arrow.right")
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isImagePickerShowing) {
            ImagePicker(imageType: viewModel.profileImageType) { image in
                Task {
                    await viewModel.updateProfileImage(image, type: viewModel.profileImageType)
                }
            }
        }
        .sheet(isPresented: $viewModel.showingSettingsSheet) {
            Text("Settings")
                .presentationDetents([.medium])
        }
        .onAppear {
            // Update the viewModel to use the actual authViewModel from environment
            viewModel.updateAuthViewModel(authViewModel)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelpers.PreviewContainer {
            ProfileView()
        }
    }
}
