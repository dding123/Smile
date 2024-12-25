//
//  PostDetailView.swift
//  Smile
//
//  Created by David Ding on 10/28/24.
//

import SwiftUI
import FirebaseAuth

struct PostDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject private var viewModel: PostDetailViewModel
    let post: Post
    var onPostDeleted: (() -> Void)?  // Add this line
    
    init(post: Post, onPostDeleted: (() -> Void)? = nil) {
        self.post = post
        self.onPostDeleted = onPostDeleted
        _viewModel = StateObject(wrappedValue: PostDetailViewModel(post: post))
    }
   
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                }
                
                Spacer()
                
                Text("Post")
                    .font(.headline)
                
                Spacer()
                
                // Options Menu
                if post.userId == Auth.auth().currentUser?.uid {
                    Menu {
                        Button(role: .destructive) {
                            viewModel.showDeleteConfirmation = true
                        } label: {
                            Label("Delete Post", systemImage: "trash")
                        }
                        
                        Button {
                            // Share functionality
                        } label: {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }
                        
                        Button {
                            // Report functionality
                        } label: {
                            Label("Report", systemImage: "flag")
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding()
            .background(Color(.systemBackground))
            
            // Content
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
                        }
                        .padding(.horizontal)
                        
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
        }
        .alert("Delete Post", isPresented: $viewModel.showDeleteConfirmation) {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) {
                Task {
                    await viewModel.deletePost()
                    await appState.refreshAllPosts()
                    await appState.refreshUserPosts()
                    onPostDeleted?()  // Add this line
                    dismiss()
                }
            }
        } message: {
            Text("Are you sure you want to delete this post? This action cannot be undone.")
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
