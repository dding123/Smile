//
//  UserView.swift
//  Smile
//
//  Created by David Ding on 11/10/24.
//
import SwiftUI

struct UserView: View {
    let userId: String
    @State private var isFollowing = false
    @StateObject private var viewModel: BaseProfileViewModel
    
    init(userId: String) {
        self.userId = userId
        self._viewModel = StateObject(wrappedValue: BaseProfileViewModel(userId: userId))
    }
    
    var body: some View {
        BaseProfileView(userId: userId, viewModel: viewModel) { 
            VStack(spacing: 12) {
                Button {
                    isFollowing.toggle()
                } label: {
                    Label(isFollowing ? "Following" : "Follow",
                          systemImage: isFollowing ? "person.badge.check" : "person.badge.plus")
                        .foregroundColor(isFollowing ? .gray : .blue)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(isFollowing ? Color.gray.opacity(0.2) : Color.blue.opacity(0.2))
                        .clipShape(Capsule())
                }
                
                Button {
                    // Message functionality to be implemented
                } label: {
                    Label("Message", systemImage: "message")
                        .foregroundColor(.blue)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.2))
                        .clipShape(Capsule())
                }
            }
            .padding()
        }
        .task {
//            print("UserView task starting profile load") // Debug print
            await viewModel.loadProfile()
//            print("UserView profile loaded: \(String(describing: viewModel.user))") // Debug print
        }
        .navigationTitle(viewModel.user?.username ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewHelpers.PreviewContainer {
//            NavigationView {
//                UserView(userId: PreviewHelpers.sampleUsers[1].id)
//            }
//        }
//    }
//}
