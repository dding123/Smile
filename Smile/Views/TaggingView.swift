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
    @Environment(\.presentationMode) var presentationMode
    @State private var caption = ""
    let imageData: Data
    private let dataService: DataService
    var onUploadSuccess: (() -> Void)?
    
    init(imageData: Data, dataService: DataService = FirebaseDataService()) {
        self.imageData = imageData
        self.dataService = dataService
    }
    
    var body: some View {
        NavigationView {
            Form {
                if let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: UIScreen.main.bounds.width) // Make it square
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .listRowInsets(EdgeInsets()) // Remove form padding
                        .listRowBackground(Color.clear) // Remove form background
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
                                viewModel.searchText = "" // Clear search text after tagging
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
            }
            .navigationTitle("Add Info")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Share") {
                        uploadPost()
                    }
                }
            }
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
                let imagePath = try await dataService.uploadImage(imageData)
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
                    onUploadSuccess?()
                }
            } catch {
                print("Error creating post: \(error.localizedDescription)")
            }
        }
    }
}

extension TaggingView {
    func onUploadSuccess(action: @escaping () -> Void) -> some View {
        var view = self
        view.onUploadSuccess = action
        return view
    }
}

struct TaggingView_Previews: PreviewProvider {
    static var previews: some View {
        TaggingView(imageData: UIImage(systemName: "photo")?.pngData() ?? Data())
            .environmentObject(AuthViewModel())
            .environmentObject(AppState())
    }
}
