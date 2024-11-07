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
        NavigationView {
            ScrollView {
                VStack(spacing: 12) {
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
                    
                    // Post image using our new PostImageView
                    PostImageView(
                        imagePath: post.imagePath,
                        size: UIScreen.main.bounds.width
                    )
                    
                    // Action buttons
                    HStack {
                        Button {
                            viewModel.toggleLike()
                        } label: {
                            Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                                .foregroundColor(viewModel.isLiked ? .red : .primary)
                        }
                        
                        Button {
                            // Focus comment field
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
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                    }
                    
                    // Caption
                    if !post.caption.isEmpty {
                        HStack {
                            Text(post.username)
                                .fontWeight(.semibold) +
                            Text(" ") +
                            Text(post.caption)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                    
                    // Comments
                    LazyVStack(alignment: .leading, spacing: 8) {
                        ForEach(viewModel.comments) { comment in
                            HStack(alignment: .top) {
                                Text(comment.username)
                                    .fontWeight(.semibold) +
                                Text(" ") +
                                Text(comment.text)
                                
                                Spacer()
                                
                                Text(comment.timeAgo)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
            
            // Comment input field
            if viewModel.isCommentingActive {
                CommentInputView(
                    text: $viewModel.newCommentText,
                    onSubmit: {
                        Task {
                            await viewModel.addComment()
                        }
                    }
                )
            }
        }
    }
}

// Helper view for comment input remains unchanged
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
        .background(Color(.systemBackground))
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.3)),
            alignment: .top
        )
    }
}
