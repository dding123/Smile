//
//  ContentView.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                MainTabView()
            } else {
                LoginView()
            }
        }
        .environmentObject(authViewModel)
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            UploadView()
                .tabItem {
                    Label("Upload", systemImage: "plus.square")
                }
            
            GroupsView()
                .tabItem {
                    Label("Groups", systemImage: "person.3")
                }
            
            ProfileView()
                .tabItem {
                    Label("Me", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
