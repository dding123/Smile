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
            ZStack {
                Theme.Colors.background
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(spacing: Theme.Metrics.padding) {
                        ForEach(appState.posts) { post in
                            PostFeedCell(post: post)
                                .id(post.uniqueId) // Ensure unique identification
                        }
                    }
                    .padding(.vertical, Theme.Metrics.padding)
                }
                .refreshable {
                    await appState.refreshAllPosts()
                }
            }
            .navigationTitle("Home")
            .task {
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
