//
//  UploadView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI
import PhotosUI

struct UploadView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImageData: Data?
    @State private var showingTaggingView = false
    
    var body: some View {
        NavigationView {
            VStack {
                if let selectedImageData,
                   let uiImage = UIImage(data: selectedImageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                }
                
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        Text("Select a photo")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                
                if selectedImageData != nil {
                    Button("Next") {
                        showingTaggingView = true
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .navigationTitle("Upload")
            .onChange(of: selectedItem) { _ in
                Task {
                    if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
            .sheet(isPresented: $showingTaggingView) {
                TaggingView(imageData: selectedImageData ?? Data())
            }
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
