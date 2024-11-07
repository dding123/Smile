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
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(appState.posts) { post in
                        PostImageView(
                            imagePath: post.imagePath,
                            size: 300
                        )
                    }
                }
                .padding(.top)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
