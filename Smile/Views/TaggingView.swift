//
//  TaggingView.swift
//  Smile
//
//  Created by David Ding on 9/18/24.
//

import Combine
import SwiftUI
import Firebase

struct TaggingView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    let imageData: Data
    @State private var caption = ""
    @State private var taggedUsers: [String] = []
    @State private var newTag = ""
    @State private var isUploading = false
    @State private var uploadError: String?
    @Environment(\.presentationMode) var presentationMode
    
    private let dataService: DataService
    @State private var cancellables = Set<AnyCancellable>()
    
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
                    HStack {
                        TextField("Tag a user", text: $newTag)
                        Button("Add") {
                            if !newTag.isEmpty {
                                taggedUsers.append(newTag)
                                newTag = ""
                            }
                        }
                    }
                    
                    ForEach(taggedUsers, id: \.self) { user in
                        Text(user)
                    }
                    .onDelete(perform: removeTag)
                }
                
                Section {
                    Button("Upload") {
                        uploadPost()
                    }
                    .disabled(isUploading)
                }
                
                if isUploading {
                    ProgressView()
                }
                
                if let error = uploadError {
                    Text(error)
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("New Post")
        }
    }
    
    func removeTag(at offsets: IndexSet) {
        taggedUsers.remove(atOffsets: offsets)
    }
    
    func uploadPost() {
        print("Starting upload process")
        isUploading = true
        uploadError = nil
        
        dataService.uploadImage(imageData)
            .flatMap { imageUrl -> AnyPublisher<Void, Error> in
                print("Image uploaded successfully. URL: \(imageUrl)")
                return self.dataService.createPost(imageUrl: imageUrl, caption: self.caption, taggedUsers: self.taggedUsers)
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    self.isUploading = false
                    switch completion {
                    case .finished:
                        print("Entire process completed successfully")
                        self.presentationMode.wrappedValue.dismiss()
                    case .failure(let error):
                        print("Error in process: \(error.localizedDescription)")
                        self.uploadError = "Failed to complete process: \(error.localizedDescription)"
                    }
                },
                receiveValue: { _ in
                    print("Received success value from createPost")
                }
            )
            .store(in: &cancellables)
    }
}

#Preview {
    TaggingView(imageData: UIImage(systemName: "photo")?.pngData() ?? Data())
        .environmentObject(AuthViewModel())
}

