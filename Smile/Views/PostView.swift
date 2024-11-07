//
//  Untitled.swift
//  Smile
//
//  Created by David Ding on 10/14/24.
//

import SwiftUI

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // User Info
            HStack {
                AsyncImage(url: URL(string: "https://placekitten.com/50/50")) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                
                Text(post.username)
                    .font(.headline)
            }
            .padding(.horizontal)
            
            // Post Image
            PostImageView(
                imagePath: post.imagePath,
                size: 300
            )
            
            // Caption
            Text(post.caption)
                .padding(.horizontal)
            
            // Like and Comment Count
            HStack {
                Image(systemName: "heart")
                Text("\(post.likeCount)")
                Image(systemName: "message")
                Text("\(post.commentCount)")
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}
