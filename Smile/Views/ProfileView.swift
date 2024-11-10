//
//  ProfileView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI

struct ProfileView: View {
    let bannerHeight: CGFloat = 200
    let profileImageSize: CGFloat = 120
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showingImagePicker = false
    @State private var profileImageType: ProfileImageType = .profilePicture
    @StateObject private var viewModel: ProfileViewModel
    @State private var selectedTab: Tab = .photos
    @State private var selectedPost: Post? = nil
    
    enum Tab {
        case photos
        case uploads
    }
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 2), count: 3)
    
    init(userId: String) {
        _viewModel = StateObject(wrappedValue: ProfileViewModel(userId: userId))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                // Banner Button
                Button {
                    profileImageType = .bannerPicture
                    showingImagePicker = true
                } label: {
                    if let user = authViewModel.currentUser,
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
                }
                
                // Profile Image Button
                Button {
                    profileImageType = .profilePicture
                    showingImagePicker = true
                } label: {
                    if let user = authViewModel.currentUser,
                       let profileUrl = user.profilePictureUrl,
                       let url = URL(string: profileUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: profileImageSize, height: profileImageSize)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                        } placeholder: {
                            Image("defaultAvatar")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: profileImageSize, height: profileImageSize)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                        }
                    } else {
                        Image("defaultAvatar")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: profileImageSize, height: profileImageSize)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    }
                }
                .offset(x: 20, y: profileImageSize / 2)
            }
            
            Spacer().frame(height: profileImageSize / 2 + 20)
            
            VStack(alignment: .leading, spacing: 8) {
                if let user = authViewModel.currentUser {
                    Text("\(user.firstName) \(user.lastName)")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("@\(user.username)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            HStack {
                Picker("", selection: $selectedTab) {
                    Text("Photos").tag(Tab.photos)
                    Text("Uploads").tag(Tab.uploads)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
            
            // Calculate the size for each grid item - screen width minus total spacing, divided by 3
            let width = (UIScreen.main.bounds.width - 40) / 3  // 40 accounts for spacing and edges

            // Photo Grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                ForEach(selectedTab == .photos ? appState.taggedPosts : appState.userPosts) { post in
                    PostImageView(
                        imagePath: post.imagePath,
                        size: width
                    )
                    .frame(width: width, height: width)  // Enforce square aspect ratio
                    .clipped()
                    .overlay(
                        Rectangle()
                            .stroke(Color.gray.opacity(0.2), lineWidth: 0.5)
                    )
                    .id(post.uniqueId)
                    .onTapGesture {
                        selectedPost = post
                    }
                }
            }
            .padding(.horizontal, 10)
            .sheet(item: $selectedPost) { post in
                PostDetailView(post: post)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.large])
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .padding()
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(imageType: profileImageType) { image in
                handleProfileImageUpdate(image, type: profileImageType)
            }
        }
        .task {
            await appState.refreshUserPosts()
        }
        .refreshable {
            await appState.refreshUserPosts()
        }
    }
    
    private func handleProfileImageUpdate(_ image: UIImage, type: ProfileImageType) {
        Task {
            do {
                try await authViewModel.updateProfileImage(image, type: type)
            } catch {
                print("Error updating profile image: \(error)")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let mockViewModel = AuthViewModel()
        mockViewModel.currentUser = User(
            id: "preview-id",
            email: "preview@example.com",
            username: "previewuser",
            firstName: "John",
            lastName: "Doe"
        )
        
        return ProfileView(userId: "preview-id")
            .environmentObject(mockViewModel)
    }
}
