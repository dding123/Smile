//
//  MainView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI

struct MainView: View {
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
                    Label("Upload", systemImage: "plus.circle.fill")
                        .labelStyle(.iconOnly)
                }
            
            
            GroupsView()
                .tabItem {
                    Label("Groups", systemImage: "person.3")
                }
            
            ProfileView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.circle")
                }
        
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
