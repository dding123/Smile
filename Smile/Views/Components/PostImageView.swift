//
//  PostImageView.swift
//  Smile
//
//  Created by David Ding on 11/6/24.
//

import SwiftUI
import FirebaseStorage

actor ImageCache {
    static let shared = ImageCache()
    private var cache: [String: UIImage] = [:]
    
    func image(for key: String) -> UIImage? {
        cache[key]
    }
    
    func setImage(_ image: UIImage, for key: String) {
        cache[key] = image
    }
}

struct PostImageView: View {
    let imagePath: String
    let size: CGFloat
    
    @State private var image: UIImage?
    @State private var isLoading = true
    @State private var loadError: Error?
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size, height: size)
                } else if loadError != nil {
                    VStack {
                        Image(systemName: "exclamationmark.triangle")
                        Text("Error")
                            .font(Theme.Typography.caption)
                    }
                    .foregroundColor(.red)
                    .frame(width: size, height: size)
                } else {
                    ProgressView()
                        .frame(width: size, height: size)
                }
            }
        }
        .frame(width: size, height: size)
        .clipped()
        .task(id: imagePath) {
            await loadImage()
        }
    }
    
    private func loadImage() async {
        // First check cache
        if let cached = await ImageCache.shared.image(for: imagePath) {
            await MainActor.run {
                self.image = cached
                self.isLoading = false
            }
            return
        }
        
        do {
            let url = try await PostImage.getURL(for: imagePath)
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let uiImage = UIImage(data: data) else {
                throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid image data"])
            }
            
            // Cache the image
            await ImageCache.shared.setImage(uiImage, for: imagePath)
            
            await MainActor.run {
                self.image = uiImage
                self.isLoading = false
            }
        } catch {
            print("Error loading image for path \(imagePath): \(error)")
            await MainActor.run {
                self.loadError = error
                self.isLoading = false
            }
        }
    }
}
