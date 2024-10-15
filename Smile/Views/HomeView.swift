//
//  ContentView.swift
//  Smile
//
//  Created by David Ding on 7/18/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.posts) { post in
                        PostView(post: post)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Home")
            .onAppear {
                viewModel.fetchPosts()
            }
            .refreshable {
                viewModel.fetchPosts()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
