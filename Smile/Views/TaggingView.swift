//
//  TaggingView.swift
//  Smile
//
//  Created by David Ding on 9/18/24.
//

import Combine
import SwiftUI
import Firebase
import FirebaseAuth

struct TaggingView: View {
    @StateObject private var viewModel = TaggingViewModel()
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var caption = ""
    let imageData: Data
    @Environment(\.presentationMode) var presentationMode
    private let dataService: DataService
    
    init(imageData: Data, dataService: DataService = FirebaseDataService()) {
        self.imageData = imageData
        self.dataService = dataService
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Photo")) {
                    if let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                }
                
                Section(header: Text("Caption")) {
                    TextField("Write a caption...", text: $caption)
                }
                
                Section(header: Text("Tag Users")) {
                    TextField("Search users...", text: $viewModel.searchText)
                        .autocapitalization(.none)
                    
                    // Search Results
                    ForEach(viewModel.searchResults) { user in
                        HStack {
                            Text(user.username)
                            Spacer()
                            if viewModel.taggedUsers.contains(user) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.blue)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if viewModel.taggedUsers.contains(user) {
                                viewModel.removeTag(user)
                            } else {
                                viewModel.tagUser(user)
                            }
                        }
                    }
                }
                
                Section(header: Text("Tagged Users")) {
                    ForEach(viewModel.taggedUsers) { user in
                        HStack {
                            Text(user.username)
                            Spacer()
                            Button(action: {
                                viewModel.removeTag(user)
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                
                Button("Upload") {
                    uploadPost()
                }
            }
            .navigationTitle("New Post")
        }
    }

    private func uploadPost() {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        guard let username = currentUser.displayName, !username.isEmpty else {
            print("Username not found")
            return
        }
        
        Task {
            do {
                // Upload image and get path
                let imagePath = try await dataService.uploadImage(imageData)
                
                // Create post with path
                let taggedUsers = viewModel.taggedUsers.map { $0.id }
                try await dataService.createPost(
                    userId: currentUser.uid,
                    username: username,
                    imagePath: imagePath,
                    caption: caption,
                    taggedUsers: taggedUsers
                )
                
                await appState.postAdded()
                
                await MainActor.run {
                    presentationMode.wrappedValue.dismiss()
                }
            } catch {
                print("Error creating post: \(error.localizedDescription)")
            }
        }
    }}

#Preview {
    TaggingView(imageData: UIImage(systemName: "photo")?.pngData() ?? Data())
        .environmentObject(AuthViewModel())
}

