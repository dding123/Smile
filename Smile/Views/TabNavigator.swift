//
//  TabNavigator.swift
//  Smile
//
//  Created by David Ding on 10/27/24.
//

import SwiftUI
import PhotosUI // Add this line

struct TabNavigator: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0
    @State private var isPickerPresented = false
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImageData: Data?
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(0)
                
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(1)
                
                Color.clear  // Using Color.clear instead of empty Group
                    .tabItem {
                        Label("Upload", systemImage: "plus.square")
                    }
                    .tag(2)
                
                GroupsView()
                    .tabItem {
                        Label("Groups", systemImage: "person.3")
                    }
                    .tag(3)
                
                ProfileView()
                    .tabItem {
                        Label("Me", systemImage: "person")
                    }
                    .tag(4)
            }
            .onChange(of: selectedTab) { newValue in
                if newValue == 2 {
                    isPickerPresented = true
                }
            }
            
            .photosPicker(
                isPresented: $isPickerPresented,
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()
            )
            .onChange(of: isPickerPresented) { isPresented in
                if !isPresented && selectedTab == 2 {
                    // If photo picker is dismissed and we're on upload tab,
                    // go back to previous tab
                    selectedTab = 0  // Or store previous tab in a @State variable
                }
            }
            .onChange(of: selectedItem) { item in
                if let item = item {
                    Task {
                        if let data = try? await item.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }
                if selectedTab == 2 {
                    selectedTab = 0
                }
            }
            
            .fullScreenCover(item: Binding(
                get: { selectedImageData.map { ImageData(data: $0) } },
                set: { newValue in
                    selectedImageData = nil
                    if selectedTab == 2 {
                        selectedTab = 0
                    }
                }
            )) { imageData in
                TaggingView(imageData: imageData.data)
                    .environmentObject(authViewModel)
                    .environmentObject(appState)
            }
        }
    }
}

private struct ImageData: Identifiable {
    let id = UUID()
    let data: Data
}


//struct TabNavigator_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewHelpers.PreviewContainer {
//            TabNavigator()
//        }
//    }
//}
