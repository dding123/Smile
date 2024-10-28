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
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showingImagePicker = false
    @State private var profileImageType: ProfileImageType = .profilePicture
    
    @State private var selectedTab: Tab = .photos
    
    enum Tab {
        case photos, uploads
    }
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 2), count: 3)
    
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
            // Spacer to account for the overlapping profile image
            Spacer().frame(height: profileImageSize / 2 + 20)
            
            // User Info (placeholder for now)
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
            
            // Navigation Tabs
            HStack {
                Picker("", selection: $selectedTab) {
                    Text("Photos").tag(Tab.photos)
                    Text("Uploads").tag(Tab.uploads)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
            
            // Photo Grid
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(0..<30) { index in
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: (UIScreen.main.bounds.width - 4) / 3) // Subtracting 4 to account for 2px spacing
                        .clipped()
                }
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(imageType: profileImageType) { image in
                handleProfileImageUpdate(image, type: profileImageType)
            }
        }
    }
    
    private func handleProfileImageUpdate(_ image: UIImage, type: ProfileImageType) {  // Changed from handleSelectedImage
        Task {
            do {
                try await authViewModel.updateProfileImage(image, type: type)  // Changed from uploadUserImage
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
        
        return ProfileView()
            .environmentObject(mockViewModel)
    }
}
