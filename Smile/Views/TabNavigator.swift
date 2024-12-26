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
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

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
                
                Color.clear
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
                    selectedTab = 0
                }
            }
            .photosPicker(
                isPresented: $isPickerPresented,
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()
            )
            .onChange(of: selectedItem) { newItem in
                if let item = newItem {
                    Task {
                        if let data = try? await item.loadTransferable(type: Data.self) {
                            await MainActor.run {
                                selectedImageData = data
                            }
                        }
                        await MainActor.run {
                            selectedItem = nil
                        }
                    }
                }
            }
            if let imageData = selectedImageData {
                TaggingView(imageData: imageData) {
                    selectedImageData = nil
                    isPickerPresented = false
                }
                .environmentObject(authViewModel)
                .environmentObject(appState)
            }
        }
    }
}

//struct TabNavigator_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewHelpers.PreviewContainer {
//            TabNavigator()
//        }
//    }
//}
