//
//  PreviewHelpers.swift
//  Smile
//
//  Created by David Ding on 11/10/24.
//
import SwiftUI

struct PreviewHelpers {
    // MARK: - Users
    static let demoUser = User(
        id: "demo-user-id",
        email: "demo@example.com",
        username: "demouser",
        firstName: "Alex",
        lastName: "Rivers",
        profilePictureUrl: "https://picsum.photos/200",
        bannerPictureUrl: "https://picsum.photos/800/400"
    )
    
    static let sampleUsers = [
        demoUser,
        User(
            id: "user-2",
            email: "sarah@example.com",
            username: "sarahsmith",
            firstName: "Sarah",
            lastName: "Smith",
            profilePictureUrl: "https://picsum.photos/201",
            bannerPictureUrl: "https://picsum.photos/800/401"
        ),
        User(
            id: "user-3",
            email: "mike@example.com",
            username: "mikechen",
            firstName: "Mike",
            lastName: "Chen",
            profilePictureUrl: "https://picsum.photos/202",
            bannerPictureUrl: "https://picsum.photos/800/402"
        )
    ]
    
    // MARK: - Posts
    static let samplePosts = [
        Post(
            id: "post1",
            userId: demoUser.id,
            username: demoUser.username,
            imagePath: "path/to/image1.jpg",
            caption: "Enjoying a beautiful sunset at the beach! The colors tonight were absolutely amazing. 🌅 #nature #peace #sunset",
            taggedUsers: ["sarahsmith"],
            createdAt: Date().addingTimeInterval(-3600),
            likeCount: 42,
            commentCount: 7
        ),
        Post(
            id: "post2",
            userId: demoUser.id,
            username: demoUser.username,
            imagePath: "path/to/image2.jpg",
            caption: "Coffee time with friends ☕️ #coffeelover #friends #weekend",
            taggedUsers: ["mikechen", "sarahsmith"],
            createdAt: Date().addingTimeInterval(-7200),
            likeCount: 89,
            commentCount: 12
        )
    ]

    static let sampleComments = [
        Comment(
            id: "comment1",
            userId: "user-2",
            username: "sarahsmith",
            text: "This looks absolutely amazing! Love the colors in this shot 😍",
            createdAt: Date().addingTimeInterval(-1800)
        ),
        Comment(
            id: "comment2",
            userId: "user-3",
            username: "mikechen",
            text: "Great composition! What camera did you use for this?",
            createdAt: Date().addingTimeInterval(-900)
        ),
        Comment(
            id: "comment3",
            userId: demoUser.id,
            username: demoUser.username,
            text: "Thanks everyone! Shot this on my iPhone 14 Pro",
            createdAt: Date().addingTimeInterval(-600)
        )
    ]
    
    // MARK: - View Models
    static let mockAuthViewModel: AuthViewModel = {
        let viewModel = AuthViewModel()
        viewModel.currentUser = demoUser
        return viewModel
    }()
    
    @MainActor static func mockProfileViewModel() -> ProfileViewModel {
        ProfileViewModel(authViewModel: mockAuthViewModel)
    }
}

// MARK: - Preview Container Views
extension PreviewHelpers {
    /// A container view that provides common environment objects for previews
    struct PreviewContainer<Content: View>: View {
        let content: Content
        
        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
        
        var body: some View {
            content
                .environmentObject(mockAuthViewModel)
        }
    }
}

// MARK: - Example TabView Preview
struct TabViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelpers.PreviewContainer {
            TabView {
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                
                UserView(userId: PreviewHelpers.sampleUsers[1].id)
                    .tabItem {
                        Label("User", systemImage: "person.2")
                    }
            }
        }
    }
}
