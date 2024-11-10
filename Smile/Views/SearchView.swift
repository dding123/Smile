//
//  SearchView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search bar
                searchBar
                
                // Results list
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.searchResults) { user in
                            NavigationLink(destination: ProfileView(userId: user.id)) {
                                UserSearchCell(userPreview: user)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search users", text: $viewModel.searchText)
                .textFieldStyle(.plain)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            if !viewModel.searchText.isEmpty {
                Button {
                    viewModel.searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding()
    }
}

struct UserSearchCell: View {
    let userPreview: UserPreview
    
    var body: some View {
        HStack(spacing: 12) {
            // Profile Image
            AsyncImage(url: URL(string: userPreview.profilePictureUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("defaultAvatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 44, height: 44)
            .clipShape(Circle())
            
            // Username
            Text(userPreview.username)
                .font(.system(size: 14, weight: .semibold))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .contentShape(Rectangle())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
