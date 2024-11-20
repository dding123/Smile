//
//  PostFeedCell.swift
//  Smile
//
//  Created by David Ding on 11/19/24.
//
import SwiftUI

struct PostFeedCell: View {
    @StateObject private var viewModel: PostDetailViewModel
    let post: Post
    
    // Calculate image size based on screen width
    private var imageSize: CGFloat {
        UIScreen.main.bounds.width - (Theme.Metrics.padding * 4)
    }
    
    init(post: Post) {
        self.post = post
        _viewModel = StateObject(wrappedValue: PostDetailViewModel(post: post))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Theme.Metrics.padding) {
            // Header
            header
            
            // Image
            postImage
                .frame(width: imageSize, height: imageSize)
                .clipped()
            
            // Actions
            actions
            
            // Content
            content
        }
        .cardStyle()
        .padding(.horizontal, Theme.Metrics.padding)
    }
    
    private var header: some View {
        HStack(spacing: Theme.Metrics.padding) {
            AsyncImage(url: URL(string: viewModel.userProfilePicture ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: Theme.Metrics.avatarSize, height: Theme.Metrics.avatarSize)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text(post.username)
                    .font(Theme.Typography.titleSmall)
                if let date = post.createdAt {
                    Text(date, style: .relative)
                        .font(Theme.Typography.caption)
                        .foregroundColor(Theme.Colors.textSecondary)
                }
            }
            
            Spacer()
            
            Menu {
                Button(action: {}) {
                    Label("Report", systemImage: "flag")
                }
                Button(action: {}) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(Theme.Colors.textSecondary)
                    .padding(8)
            }
        }
    }
    
    private var postImage: some View {
        PostImageView(imagePath: post.imagePath, size: imageSize)
            .clipShape(RoundedRectangle(cornerRadius: Theme.Metrics.cornerRadius))
    }
    
    private var actions: some View {
        HStack(spacing: Theme.Metrics.padding * 1.5) {
            Button {
                viewModel.toggleLike()
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.isLiked ? .red : Theme.Colors.textPrimary)
                    Text("\(viewModel.likeCount)")
                        .font(Theme.Typography.bodyMedium)
                }
            }
            
            NavigationLink {
                PostDetailView(post: post)
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "bubble.right")
                    Text("\(post.commentCount)")
                        .font(Theme.Typography.bodyMedium)
                }
            }
            
            Button {
                // Share functionality
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            
            Spacer()
        }
        .foregroundColor(Theme.Colors.textPrimary)
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 8) {
            if !post.caption.isEmpty {
                Text(post.username).font(Theme.Typography.titleSmall) +
                Text(" \(post.caption)")
                    .font(Theme.Typography.bodyMedium)
            }
            
            if !viewModel.comments.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(viewModel.comments.prefix(2)) { comment in
                        HStack {
                            Text(comment.username)
                                .font(Theme.Typography.bodyMedium)
                                .fontWeight(.semibold)
                            Text(comment.text)
                                .font(Theme.Typography.bodyMedium)
                                .lineLimit(1)
                        }
                    }
                }
                .padding(.top, 4)
            }
        }
    }
}
