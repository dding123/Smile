//
//  ContentView.swift
//  Smile
//
//  Created by David Ding on 7/18/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(appState.posts, id: \.uniqueId) { post in
                        PostFeedCell(post: post)
                    }
                }
            }
            .navigationTitle("Home")
            .task {
                await appState.refreshAllPosts()
            }
            .refreshable {
                await appState.refreshAllPosts()
            }
        }
    }
}

struct PostFeedCell: View {
    @StateObject private var viewModel: PostDetailViewModel
    let post: Post
    
    init(post: Post) {
        self.post = post
        _viewModel = StateObject(wrappedValue: PostDetailViewModel(post: post))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // User info header
            HStack(spacing: 8) {
                AsyncImage(url: URL(string: viewModel.userProfilePicture ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Circle()
                        .foregroundColor(.gray)
                }
                .frame(width: 36, height: 36)
                .clipShape(Circle())
                
                Text(post.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    // More options
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            
            // Post image
            GeometryReader { geometry in
                PostImageView(
                    imagePath: post.imagePath,
                    size: geometry.size.width
                )
                .frame(width: geometry.size.width, height: geometry.size.width)
            }
            .aspectRatio(1, contentMode: .fit)
            
            // Action buttons
            HStack(spacing: 20) {
                Button {
                    viewModel.toggleLike()
                } label: {
                    Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.isLiked ? .red : .primary)
                }
                
                NavigationLink {
                    PostDetailView(post: post)
                } label: {
                    Image(systemName: "bubble.right")
                        .foregroundColor(.primary)
                }
                
                Button {
                    // Share
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.primary)
                }
                
                Spacer()
            }
            .font(.system(size: 22))
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
            // Likes count
            if viewModel.likeCount > 0 {
                Text("\(viewModel.likeCount) likes")
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.horizontal, 16)
            }
            
            // Caption
            if !post.caption.isEmpty {
                HStack(alignment: .top, spacing: 6) {
                    Text(post.username)
                        .fontWeight(.semibold)
                    Text(post.caption)
                        .lineLimit(2)
                }
                .font(.system(size: 14))
                .padding(.horizontal, 16)
            }
            
            // Comments preview
            if !viewModel.comments.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                    ForEach(viewModel.comments.prefix(2)) { comment in
                        HStack(alignment: .top, spacing: 6) {
                            Text(comment.username)
                                .fontWeight(.semibold)
                            Text(comment.text)
                                .lineLimit(1)
                        }
                        .font(.system(size: 14))
                    }
                    
                    if viewModel.comments.count > 2 {
                        Button {
                            // View all comments
                        } label: {
                            Text("View all \(viewModel.comments.count) comments")
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            
            // Timestamp
            if let date = post.createdAt {
                Text(date, style: .relative)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 16)
                    .padding(.top, 4)
            }
        }
        .padding(.vertical, 8)
        Divider()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
