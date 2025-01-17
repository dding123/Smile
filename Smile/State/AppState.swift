//
//  AppState.swift
//  Smile
//
//  Created by David Ding on 11/6/24.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AppState: ObservableObject {
    @Published var posts: [Post] = []
    @Published var userPosts: [Post] = []
    @Published var taggedPosts: [Post] = []
    private let dataService: DataService
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
    }
    
    @MainActor
    func refreshAllPosts() async {
        do {
            let snapshot = try await Firestore.firestore()
                .collection("posts")
                .order(by: "createdAt", descending: true)
                .limit(to: 20)
                .getDocuments()
            
            posts = snapshot.documents.compactMap { document in
                do {
                    var post = try document.data(as: Post.self)
                    post.id = document.documentID
//                    print("Loaded post: \(post.id ?? "unknown"), imagePath: \(post.imagePath)")
                    return post
                } catch {
                    print("Error decoding post: \(error)")
                    return nil
                }
            }
        } catch {
            print("Error refreshing posts: \(error)")
        }
    }
    
    @MainActor
    func refreshUserPosts() async {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        do {
            // Fetch user's uploaded posts
            userPosts = try await dataService.fetchUserPosts(userId: userId, limit: 12, after: nil)
            
            // Fetch posts where user is tagged
            taggedPosts = try await dataService.fetchTaggedPosts(userId: userId, limit: 12, after: nil)
        } catch {
            print("Error refreshing user posts: \(error)")
        }
    }
    
    @MainActor
    func postAdded() async {
        do {
            // Wait for 1 second to allow Firebase to process
            try await Task.sleep(nanoseconds: 1_000_000_000)
            
            // Refresh posts
            await refreshUserPosts()
            await refreshAllPosts()
            
//            print("AppState postAdded: Posts refreshed")
            
            // Print the paths of the most recent posts to verify
            if let latestPost = userPosts.first {
                print("Latest post path: \(latestPost.imagePath)")
            }
        } catch {
            print("Error in postAdded: \(error)")
        }
    }
}
