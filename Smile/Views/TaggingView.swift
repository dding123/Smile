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
    @EnvironmentObject var authViewModel: AuthViewModel
    let imageData: Data
    @State private var cancellables = Set<AnyCancellable>()
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    private let dataService = FirebaseDataService()
    
    init(imageData: Data, dataService: DataService = FirebaseDataService()) {
        self.imageData = imageData
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
        
        print("Current user displayName: \(currentUser.displayName ?? "nil")")
        
        dataService.uploadImage(imageData)
            .flatMap { imageUrl -> AnyPublisher<Void, Error> in
                let taggedUsers = viewModel.taggedUsers.map { $0.id }
                
                // Make sure we have a username
                guard let username = currentUser.displayName, !username.isEmpty else {
                    return Fail(error: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Username not found"]))
                        .eraseToAnyPublisher()
                }
                
                return self.dataService.createPost(
                    userId: currentUser.uid,
                    username: username,
                    imageUrl: imageUrl,
                    caption: caption,
                    taggedUsers: taggedUsers
                )
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error creating post: \(error.localizedDescription)")
                }
                self.presentationMode.wrappedValue.dismiss()
            }, receiveValue: { _ in })
            .store(in: &cancellables)
    }
}

#Preview {
    TaggingView(imageData: UIImage(systemName: "photo")?.pngData() ?? Data())
        .environmentObject(AuthViewModel())
}

