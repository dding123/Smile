//
//  TabNavigator.swift
//  Smile
//
//  Created by David Ding on 10/27/24.
//

import SwiftUI

struct TabNavigator: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
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

struct TabNavigator_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelpers.PreviewContainer {
            TabNavigator()
        }
    }
}
