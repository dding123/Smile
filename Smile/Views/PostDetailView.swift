//
//  PostDetailView.swift
//  Smile
//
//  Created by David Ding on 10/28/24.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: PostDetailViewModel
    let post: Post
    
    init(post: Post) {
        self.post = post
        _viewModel = StateObject(wrappedValue: PostDetailViewModel(post: post))
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    // User info header
                    HStack {
                        AsyncImage(url: URL(string: viewModel.userProfilePicture ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Circle()
                                .foregroundColor(.gray)
                        }
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        
                        Text(post.username)
                            .font(.headline)
                        
                        Spacer()
                        
                        Button {
                            // Add more options menu
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                    }
                    .padding(.horizontal)
                    
                    // Post image
                    PostImageView(
                        imagePath: post.imagePath,
                        size: geometry.size.width
                    )
                    .frame(width: geometry.size.width)
                    
                    // Action buttons
                    HStack(spacing: 16) {
                        Button {
                            viewModel.toggleLike()
                        } label: {
                            Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                                .foregroundColor(viewModel.isLiked ? .red : .primary)
                        }
                        
                        Button {
                            viewModel.isCommentingActive = true
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            // Share functionality
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        
                        Spacer()
                    }
                    .font(.title3)
                    .padding(.horizontal)
                    
                    // Likes count
                    if viewModel.likeCount > 0 {
                        Text("\(viewModel.likeCount) likes")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                    }
                    
                    // Caption
                    if !post.caption.isEmpty {
                        HStack(alignment: .top, spacing: 4) {
                            Text(post.username)
                                .fontWeight(.semibold)
                            Text(post.caption)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Comments
                    ForEach(viewModel.comments) { comment in
                        HStack(alignment: .top, spacing: 4) {
                            Text(comment.username)
                                .fontWeight(.semibold)
                            Text(comment.text)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                            Text(comment.timeAgo)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                    }
                }
                .frame(width: geometry.size.width)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .overlay(alignment: .top) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                        .padding()
                }
                Spacer()
            }
            .background(.thinMaterial)
        }
        .overlay(alignment: .bottom) {
            if viewModel.isCommentingActive {
                CommentInputView(
                    text: $viewModel.newCommentText,
                    onSubmit: {
                        Task {
                            await viewModel.addComment()
                        }
                    }
                )
                .background(.thinMaterial)
            }
        }
    }
}

// Update CommentInputView to ensure proper width
struct CommentInputView: View {
    @Binding var text: String
    let onSubmit: () -> Void
    
    var body: some View {
        HStack {
            TextField("Add a comment...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Post") {
                onSubmit()
            }
            .disabled(text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.3)),
            alignment: .top
        )
    }
}
