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
    @Environment(\.dismiss) var dismiss  // Change this line
    @State private var caption = ""
    @State private var isUploading = false
    let imageData: Data
    private let dataService: DataService
    let onDismiss: () -> Void
    
    
    init(imageData: Data, dataService: DataService = FirebaseDataService(), onDismiss: @escaping () -> Void = {}) {
        self.imageData = imageData
        self.dataService = dataService
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Image Section
                Section {
                    if let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: UIScreen.main.bounds.width)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .listRowInsets(EdgeInsets())
                    }
                }
                
                // Caption Section
                Section(header: Text("Caption")) {
                    TextField("Write a caption...", text: $caption)
                }
                
                // Tag Users Section
                Section(header: Text("Tag Users")) {
                    TextField("Search users...", text: $viewModel.searchText)
                        .autocapitalization(.none)
                    
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
                                viewModel.searchText = ""
                            }
                        }
                    }
                }
                
                // Tagged Users Section
                if !viewModel.taggedUsers.isEmpty {
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
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        onDismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Share") {
                        uploadPost()
                    }
                    .disabled(isUploading) 
                }
            }
            .disabled(isUploading)
            .overlay {
                if isUploading {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .overlay {
                            ProgressView()
                                .tint(.white)
                                .scaleEffect(1.5)
                        }
                }
            }
        }
        .interactiveDismissDisabled(isUploading)
    }

    private func uploadPost() {
        print("🚀 Starting upload")  // Debug print
        guard !isUploading else {
            print("⚠️ Upload already in progress")  // Debug print
            return
        }
        isUploading = true
        
        Task {
            do {
                let imagePath = try await dataService.uploadImage(imageData)
                let taggedUsers = viewModel.taggedUsers.map { $0.id }
                
                print("📸 Image uploaded, creating post")  // Debug print
                try await dataService.createPost(
                    userId: Auth.auth().currentUser?.uid ?? "",
                    username: Auth.auth().currentUser?.displayName ?? "",
                    imagePath: imagePath,
                    caption: caption,
                    taggedUsers: taggedUsers
                )
                
                await appState.postAdded()
                
                await MainActor.run {
                    print("✅ Upload complete, calling onDismiss")  // Debug print
                    isUploading = false
                    onDismiss()
                }
            } catch {
                print("❌ Upload error: \(error)")
                await MainActor.run {
                    isUploading = false
                }
            }
        }
    }
}

struct TaggingView_Previews: PreviewProvider {
    static var previews: some View {
        TaggingView(imageData: UIImage(systemName: "photo")?.pngData() ?? Data())
            .environmentObject(AuthViewModel())
            .environmentObject(AppState())
    }
}
