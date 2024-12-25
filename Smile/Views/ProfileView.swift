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
    var bannerHeight: CGFloat { UIScreen.main.bounds.height * 0.20 }
    var profileImageSize: CGFloat { UIScreen.main.bounds.width * 0.28 } 
    
    init() {
            _viewModel = StateObject(wrappedValue: ProfileViewModel(authViewModel: PreviewHelpers.mockAuthViewModel))
        }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Banner and Profile Section
                ZStack(alignment: .bottomLeading) {
                    // Banner Image with Settings Button
                    ZStack(alignment: .bottomTrailing) {
                        if let user = viewModel.user,
                           let bannerUrl = user.bannerPictureUrl,
                           let url = URL(string: bannerUrl) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Image("bannerImage")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                            .frame(height: bannerHeight)
                            .clipped()
                        } else {
                            Image("bannerImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: bannerHeight)
                                .clipped()
                        }
                        
                        Button {
                            viewModel.showingSettingsSheet = true
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(.black.opacity(0.3))
                                .clipShape(Circle())
                        }
                        .padding()
                    }
                    
                    // Profile Image
                    Button {
                        viewModel.profileImageType = .profilePicture
                        viewModel.isImagePickerShowing = true
                    } label: {
                        if let user = viewModel.user,
                           let profileUrl = user.profilePictureUrl,
                           let url = URL(string: profileUrl) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Image("defaultAvatar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                            .frame(width: profileImageSize, height: profileImageSize)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        } else {
                            Image("defaultAvatar")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: profileImageSize, height: profileImageSize)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        }
                    }
                    .offset(x: UIScreen.main.bounds.width * 0.08, y: profileImageSize / 2)
                    .shadow(radius: 10)
                }
                
                // User Info
                VStack(alignment: .leading, spacing: 4) {
                    Spacer()
                        .frame(height: profileImageSize/2 + 12)
                    
                    if let user = viewModel.user {
                        Text("\(user.firstName) \(user.lastName)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("@\(user.username)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, UIScreen.main.bounds.width * 0.08)  // Match profile image offset
                .frame(maxWidth: .infinity, alignment: .leading)  // Force left alignment
                
                // Posts Grid
                PostsGridView(uploadedPosts: viewModel.uploadedPosts,
                            taggedPosts: viewModel.taggedPosts)
                    .padding(.top, 2)
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        .sheet(isPresented: $viewModel.isImagePickerShowing) {
            ImagePicker(imageType: viewModel.profileImageType) { image in
                Task {
                    await viewModel.updateProfileImage(image, type: viewModel.profileImageType)
                }
            }
        }
        .sheet(isPresented: $viewModel.showingSettingsSheet) {
            SettingsView(viewModel: viewModel)
        }
        .onAppear {
            viewModel.updateAuthViewModel(authViewModel)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
                .environmentObject(PreviewHelpers.mockAuthViewModel)
        }
    }
}
