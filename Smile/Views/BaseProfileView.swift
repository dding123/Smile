//
//  BaseProfileView.swift
//  Smile
//
//  Created by David Ding on 11/10/24.
//


import SwiftUI

struct BaseProfileView<Content: View>: View {
    let userId: String
    let bannerHeight: CGFloat = 200
    let profileImageSize: CGFloat = 120
    @ObservedObject var viewModel: BaseProfileViewModel 
    @State private var selectedTab: BaseProfileViewModel.Tab = .photos
    @State private var selectedPost: Post? = nil
    let additionalContent: () -> Content
    
    init(userId: String, viewModel: BaseProfileViewModel, @ViewBuilder additionalContent: @escaping () -> Content) {
        self.userId = userId
        self.viewModel = viewModel
        self.additionalContent = additionalContent
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                // Banner image
                bannerImage
                
                // Profile image
                profileImage
                    .offset(x: 20, y: profileImageSize / 2)
            }
            
            Spacer().frame(height: profileImageSize / 2 + 20)
            
            // User info
            userInfo
            
            // Additional content passed from specific views
            additionalContent()
            
            // Post grid section
            postGridSection
        }
        .ignoresSafeArea(.container, edges: .top)
        .task {
            await viewModel.loadProfile()
        }
        .refreshable {
            await viewModel.loadProfile()
        }
    }
    
    private var bannerImage: some View {
        Group {
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
        }
    }
    
    private var profileImage: some View {
        Group {
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
            } else {
                Image("defaultAvatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .frame(width: profileImageSize, height: profileImageSize)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
    
    private var userInfo: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let displayUser = viewModel.user {
                Text("\(displayUser.firstName) \(displayUser.lastName)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("@\(displayUser.username)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
    }
    
    private var postGridSection: some View {
        VStack {
            Picker("Post Type", selection: $selectedTab) {
                Text("Photos").tag(BaseProfileViewModel.Tab.photos)
                Text("Uploads").tag(BaseProfileViewModel.Tab.uploads)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 2), count: 3)
            let width = (UIScreen.main.bounds.width - 4) / 3
            
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(selectedTab == .photos ? viewModel.taggedPosts : viewModel.uploadedPosts) { post in
                    PostImageView(
                        imagePath: post.imagePath,
                        size: width
                    )
                    .frame(width: width, height: width)
                    .clipped()
                    .onTapGesture {
                        selectedPost = post
                    }
                }
            }
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
    }
}
