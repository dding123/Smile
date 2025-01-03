//
//  ContentView.swift
//  Smile
//
//  Created by David Ding on 7/18/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    @State private var showNotifications = false
    @State private var showMessages = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Theme.Colors.background
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(spacing: Theme.Metrics.padding) {
                        ForEach(appState.posts) { post in
                            PostFeedCell(post: post)
                                .id(post.uniqueId)
                        }
                    }
                    .padding(.vertical, Theme.Metrics.padding)
                }
                .refreshable {
                    await appState.refreshAllPosts()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("homeLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 32)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button {
                            showNotifications.toggle()
                        } label: {
                            Image(systemName: "bell")
                                .font(.system(size: 20))
                                .foregroundColor(Theme.Colors.textPrimary)
                        }
                        
                        Button {
                            showMessages.toggle()
                        } label: {
                            Image(systemName: "envelope")
                                .font(.system(size: 20))
                                .foregroundColor(Theme.Colors.textPrimary)
                        }
                    }
                }
            }
            .sheet(isPresented: $showNotifications) {
                NotificationsView()
            }
            .sheet(isPresented: $showMessages) {
                MessagesView()
            }
            .task {
                await appState.refreshAllPosts()
            }
        }
    }
}

// Placeholder views for notifications and messages
struct NotificationsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Text("No notifications yet")
                    .foregroundColor(.gray)
            }
            .navigationTitle("Notifications")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct MessagesView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Text("No messages yet")
                    .foregroundColor(.gray)
            }
            .navigationTitle("Messages")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelpers.PreviewContainer {
            HomeView()
                .environmentObject(AppState())
        }
    }
}
