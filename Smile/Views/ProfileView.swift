//
//  ProfileView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI

struct ProfileView: View {
    let bannerHeight: CGFloat = 200
    let profileImageSize: CGFloat = 120
    
    @State private var selectedTab: Tab = .photos
    
    enum Tab {
        case photos, uploads
    }
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 2), count: 3)
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Banner Image
                ZStack(alignment: .bottomLeading) {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: bannerHeight)
                        .clipped()
                    
                    // Profile Image
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: profileImageSize, height: profileImageSize)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .offset(x: 20, y: profileImageSize / 2)
                }
                
                // Spacer to account for the overlapping profile image
                Spacer().frame(height: profileImageSize / 2 + 20)
                
                // User Info (placeholder for now)
                VStack(alignment: .leading, spacing: 8) {
                    Text("User Name")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("User Bio goes here")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // Navigation Tabs
                HStack {
                    Picker("", selection: $selectedTab) {
                        Text("Photos").tag(Tab.photos)
                        Text("Uploads").tag(Tab.uploads)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
                
                // Photo Grid
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(0..<30) { index in
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: (UIScreen.main.bounds.width - 4) / 3) // Subtracting 4 to account for 2px spacing
                            .clipped()
                    }
                }

            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
