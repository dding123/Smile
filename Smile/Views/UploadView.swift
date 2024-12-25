//
//  UploadView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI
import PhotosUI

struct UploadView: View {
    @State private var isPickerPresented = false
    @State private var selectedImageData: Data?
    
    var body: some View {
        NavigationView {
            Color.clear // Using Color.clear instead of empty VStack
                .navigationTitle("Upload")
                .photosPicker(
                    isPresented: $isPickerPresented,
                    selection: .init(get: { nil }, set: { item in
                        if let item = item {
                            Task {
                                if let data = try? await item.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                }
                            }
                        }
                    }),
                    matching: .images,
                    preferredItemEncoding: .automatic
                )
                .fullScreenCover(item: Binding(
                    get: { selectedImageData.map { ImageData(data: $0) } },
                    set: { if $0 == nil { selectedImageData = nil; isPickerPresented = true } }
                )) { imageData in
                    TaggingView(imageData: imageData.data)
                }
                .onAppear {
                    isPickerPresented = true
                }
        }
    }
}

// Helper struct to make Data conform to Identifiable
private struct ImageData: Identifiable {
    let id = UUID()
    let data: Data
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
