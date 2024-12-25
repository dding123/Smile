//
//  UserView.swift
//  Smile
//
//  Created by David Ding on 11/10/24.
//
import SwiftUI

struct UserView: View {
    let userId: String
    @StateObject private var viewModel: UserViewModel
    let bannerHeight: CGFloat = 200
    let profileImageSize: CGFloat = 120
    
    init(userId: String) {
        self.userId = userId
        _viewModel = StateObject(wrappedValue: UserViewModel(userId: userId))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Banner and Profile Section
                ZStack(alignment: .bottomLeading) {
                    // Banner Image
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
                    
                    // Profile Image
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
                        .offset(x: 20, y: profileImageSize / 2)
                        .shadow(radius: 10)
                    } else {
                        Image("defaultAvatar")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: profileImageSize, height: profileImageSize)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .offset(x: 20, y: profileImageSize / 2)
                            .shadow(radius: 10)
                    }
                }
                
                // User Info
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                        .frame(height: profileImageSize/2 + 20)
                    
                    if let user = viewModel.user {
                        Text("\(user.firstName) \(user.lastName)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("@\(user.username)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    // Follow/Message Buttons
                    HStack(spacing: 12) {
                        Button {
                            viewModel.toggleFollow()
                        } label: {
                            Label(viewModel.isFollowing ? "Following" : "Follow",
                                  systemImage: viewModel.isFollowing ? "person.badge.check" : "person.badge.plus")
                                .foregroundColor(viewModel.isFollowing ? .gray : .blue)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(viewModel.isFollowing ? Color.gray.opacity(0.2) : Color.blue.opacity(0.2))
                                .clipShape(Capsule())
                        }
                        
                        Button {
                            viewModel.sendMessage()
                        } label: {
                            Label("Message", systemImage: "message")
                                .foregroundColor(.blue)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(Color.blue.opacity(0.2))
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
                
                // Posts Grid
                PostsGridView(uploadedPosts: viewModel.uploadedPosts,
                            taggedPosts: viewModel.taggedPosts,
                              onPostDeleted: nil)
                    .padding(.top)
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        .task {
            await viewModel.loadProfile()
        }
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewHelpers.PreviewContainer {
//            NavigationView {
//                UserView(userId: PreviewHelpers.sampleUsers[1].id)
//            }
//        }
//    }
//}
