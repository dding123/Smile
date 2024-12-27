//
//  PostsGridView.swift
//  Smile
//
//  Created by David Ding on 12/22/24.
//
import SwiftUI

struct PostsGridView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0
    @State private var selectedPost: Post? = nil
    let uploadedPosts: [Post]
    let taggedPosts: [Post]
    let onPostDeleted: ((Post) -> Void)?  // Make callback optional

    var body: some View {
        VStack {
            Picker("Post Type", selection: $selectedTab) {
                Text("Photos").tag(0)
                Text("Tagged").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            let columns = [
                GridItem(.flexible(), spacing: 2),
                GridItem(.flexible(), spacing: 2),
                GridItem(.flexible(), spacing: 2)
            ]
            
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(selectedTab == 0 ? uploadedPosts : taggedPosts) { post in
                    PostImageView(imagePath: post.imagePath,
                                size: UIScreen.main.bounds.width / 3 - 1)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .contentShape(RoundedRectangle(cornerRadius: 8))
                        .clipped()
                        .onTapGesture {
                            selectedPost = post
                        }
                }
            }
            .sheet(item: $selectedPost) { post in
                PostDetailView(post: post){
                    // Add the deletion handler here
                    onPostDeleted?(post)
                }
                .onDisappear {
                    Task {
                        await appState.refreshAllPosts()
                    }
                }
                }
        }
    }
}
