//
//  FirebaseDataService.swift
//  Smile
//
//  Created by David Ding on 9/18/24.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import SwiftUI

class FirebaseDataService: DataService {
    
    func uploadImage(_ data: Data) async throws -> String {
        let imageName = UUID().uuidString + ".jpg"
        let path = "post_images/\(imageName)"
        let storageRef = Storage.storage().reference().child(path)
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        _ = try await storageRef.putDataAsync(data, metadata: metadata)
        print("Image uploaded successfully to path: \(path)")
        
        // Return the path instead of URL
        return path
    }

    func createPost(userId: String, username: String, imagePath: String, caption: String, taggedUsers: [String]) async throws {
        let db = Firestore.firestore()
        let postRef = db.collection("posts").document()
        
        let postData: [String: Any] = [
            "userId": userId,
            "username": username,
            "imagePath": imagePath,  // Store path instead of URL
            "caption": caption,
            "taggedUsers": taggedUsers,
            "createdAt": FieldValue.serverTimestamp(),
            "likeCount": 0,
            "commentCount": 0
        ]
        
        try await postRef.setData(postData)
    }
    
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        let db = Firestore.firestore()
        
        return Future { promise in
            Task {
                do {
                    let snapshot = try await db.collection("posts")
                        .order(by: "createdAt", descending: true)
                        .limit(to: 20)
                        .getDocuments()
                    
                    let posts = await snapshot.documents.asyncCompactMap { document -> Post? in
                        do {
                            var post = try document.data(as: Post.self)
                            
                            // Fetch the username if it's not stored in the post document
                            if post.username.isEmpty {
                                let userDoc = try await db.collection("users").document(post.userId).getDocument()
                                post.username = userDoc.data()?["username"] as? String ?? "Unknown User"
                            }
                            
                            return post
                        } catch {
                            print("Error decoding post: \(error)")
                            return nil
                        }
                    }
                    
                    promise(.success(posts))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    func signIn(email: String, password: String) async throws -> User {
        // Sign in with Firebase Auth
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        let firebaseUser = authResult.user  // No need for guard let, this will throw if it fails
        
        // Fetch additional user data from Firestore
        let db = Firestore.firestore()
        let document = try await db.collection("users")
            .document(firebaseUser.uid)
            .getDocument()
        
        guard let data = document.data(),
              let username = data["username"] as? String,
              let firstName = data["firstName"] as? String,
              let lastName = data["lastName"] as? String else {
            throw NSError(domain: "FirebaseDataService", code: 0,
                userInfo: [NSLocalizedDescriptionKey: "Failed to get user data"])
        }
        
        return User(
            id: firebaseUser.uid,
            email: firebaseUser.email ?? email,
            username: username,
            firstName: firstName,
            lastName: lastName,
            profilePictureUrl: data["profilePictureUrl"] as? String,
            bannerPictureUrl: data["bannerPictureUrl"] as? String
        )
    }

    func signUp(email: String, password: String, username: String, firstName: String, lastName: String) async throws -> User {
        // Create user in Firebase Auth
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let firebaseUser = authResult.user  // No need for guard let
        
        // Update display name
        let changeRequest = firebaseUser.createProfileChangeRequest()
        changeRequest.displayName = username
        try await changeRequest.commitChanges()
        
        // Create user document in Firestore
        let db = Firestore.firestore()
        let userData: [String: Any] = [
            "username": username,
            "email": email,
            "firstName": firstName,
            "lastName": lastName,
            "createdAt": FieldValue.serverTimestamp()
        ]
        
        try await db.collection("users")
            .document(firebaseUser.uid)
            .setData(userData)
        
        return User(
            id: firebaseUser.uid,
            email: email,
            username: username,
            firstName: firstName,
            lastName: lastName
        )
    }
    
    func signOut() async throws {
        try Auth.auth().signOut()
    }

    func searchUsers(matching query: String) async throws -> [UserPreview] {
        let db = Firestore.firestore()
//        print("Starting Firestore query for: \(query)")
        
        let snapshot = try await db.collection("users")
            .whereField("username", isGreaterThanOrEqualTo: query.lowercased())
            .whereField("username", isLessThan: query.lowercased() + "\u{f8ff}")
            .limit(to: 10)
            .getDocuments()
        
        return snapshot.documents.compactMap { document -> UserPreview? in
            guard let username = document.data()["username"] as? String else {
                print("Failed to get username from document: \(document.documentID)")
                return nil
            }
            return UserPreview(id: document.documentID, username: username)
        }
    }
    
    func uploadProfileImage(_ data: Data, path: String) async throws -> URL {
        let storageRef = Storage.storage().reference().child(path)
        
        // Upload the data
        _ = try await storageRef.putDataAsync(data)
        
        // Get the download URL
        return try await storageRef.downloadURL()
    }

    func updateUserProfileImage(userId: String, imageUrl: String, type: ProfileImageType) async throws {
        let db = Firestore.firestore()
        let field = type == .profilePicture ? "profilePictureUrl" : "bannerPictureUrl"
        
        try await db.collection("users").document(userId)
            .setData([field: imageUrl], merge: true)
    }
    
    func fetchUserPosts(userId: String, limit: Int = 12, after post: Post? = nil) async throws -> [Post] {
        let db = Firestore.firestore()
//        print("Fetching posts for userId: \(userId)") // Add debug print
        
        var query = db.collection("posts")
            .whereField("userId", isEqualTo: userId)
            .order(by: "createdAt", descending: true)
            .limit(to: limit)
        
        if let post = post, let postDate = post.createdAt {
            query = query.start(after: [postDate])
        }
        
        let snapshot = try await query.getDocuments()
//        print("Found \(snapshot.documents.count) documents") // Add debug print
        
        let posts = snapshot.documents.compactMap { document -> Post? in
            do {
                var post = try document.data(as: Post.self)
                // Ensure the post has an ID
                post.id = document.documentID
                return post
            } catch {
                print("Error decoding post document: \(error)") // Add debug print
                return nil
            }
        }
        
//        print("Successfully decoded \(posts.count) posts") // Add debug print
        return posts
    }
    
    func fetchTaggedPosts(userId: String, limit: Int = 12, after post: Post? = nil) async throws -> [Post] {
        let db = Firestore.firestore()
//        print("Fetching tagged posts for userId: \(userId)") // Add debug print
        
        var query = db.collection("posts")
            .whereField("taggedUsers", arrayContains: userId)
            .order(by: "createdAt", descending: true)
            .limit(to: limit)
        
        if let post = post, let postDate = post.createdAt {
            query = query.start(after: [postDate])
        }
        
        let snapshot = try await query.getDocuments()
//        print("Found \(snapshot.documents.count) tagged documents") // Add debug print
        
        let posts = snapshot.documents.compactMap { document -> Post? in
            do {
                var post = try document.data(as: Post.self)
                // Ensure the post has an ID
                post.id = document.documentID
                return post
            } catch {
                print("Error decoding tagged post document: \(error)") // Add debug print
                return nil
            }
        }
        
//        print("Successfully decoded \(posts.count) tagged posts") // Add debug print
        return posts
    }
    
    func fetchComments(for postId: String) async throws -> [Comment] {
        guard !postId.isEmpty else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid post ID"])
        }
        
        let db = Firestore.firestore()
        let snapshot = try await db.collection("posts")
            .document(postId)
            .collection("comments")
            .order(by: "createdAt", descending: false)
            .getDocuments()
            
        return snapshot.documents.compactMap { try? $0.data(as: Comment.self) }
    }
    
    func addComment(to postId: String, text: String) async throws {
        guard !postId.isEmpty else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid post ID"])
        }
        
        guard let currentUser = Auth.auth().currentUser else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        let db = Firestore.firestore()
        
        // Get current user's username
        let userDoc = try await db.collection("users").document(currentUser.uid).getDocument()
        guard let username = userDoc.data()?["username"] as? String else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Could not get username"])
        }
        
        // Create the comment
        let comment = Comment(
            userId: currentUser.uid,
            username: username,
            text: text,
            createdAt: nil  // Will be set by server timestamp
        )
        
        // Add comment document
        let commentRef = db.collection("posts")
            .document(postId)
            .collection("comments")
            .document()
        
        try await commentRef.setData([
            "userId": comment.userId,
            "username": comment.username,
            "text": comment.text,
            "createdAt": FieldValue.serverTimestamp()
        ])
        
        // Update comment count
        try await db.collection("posts")
            .document(postId)
            .updateData([
                "commentCount": FieldValue.increment(Int64(1))
            ])
    }
    
    func fetchLikeStatus(for postId: String) async throws -> LikeStatus {
        guard let currentUser = Auth.auth().currentUser else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        let db = Firestore.firestore()
        
        // Get like document
        let likeDoc = try await db.collection("posts")
            .document(postId)
            .collection("likes")
            .document(currentUser.uid)
            .getDocument()
        
        // Get total likes count
        let postDoc = try await db.collection("posts")
            .document(postId)
            .getDocument()
        
        let likeCount = postDoc.data()?["likeCount"] as? Int ?? 0
        let isLiked = likeDoc.exists
        
        return LikeStatus(isLiked: isLiked, count: likeCount)
    }
    
    func toggleLike(for postId: String) async throws {
        guard !postId.isEmpty else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid post ID"])
        }
        
        guard let currentUser = Auth.auth().currentUser else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        let db = Firestore.firestore()
        let likeRef = db.collection("posts")
            .document(postId)
            .collection("likes")
            .document(currentUser.uid)
        
        let likeDoc = try await likeRef.getDocument()
        
        // Store the result of runTransaction
        let _ = try await db.runTransaction { transaction, errorPointer in
            let postRef = db.collection("posts").document(postId)
            
            if likeDoc.exists {
                // Unlike
                transaction.deleteDocument(likeRef)
                transaction.updateData([
                    "likeCount": FieldValue.increment(Int64(-1))
                ], forDocument: postRef)
            } else {
                // Like
                transaction.setData([:], forDocument: likeRef)
                transaction.updateData([
                    "likeCount": FieldValue.increment(Int64(1))
                ], forDocument: postRef)
            }
            
            return nil
        }
    }
    
    func fetchUserProfile(userId: String) async throws -> User {
        let db = Firestore.firestore()
        let document = try await db.collection("users").document(userId).getDocument()
        
        guard let data = document.data(),
              let username = data["username"] as? String,
              let email = data["email"] as? String,
              let firstName = data["firstName"] as? String,
              let lastName = data["lastName"] as? String else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to get user data"])
        }
        
        return User(
            id: userId,
            email: email,
            username: username,
            firstName: firstName,
            lastName: lastName,
            profilePictureUrl: data["profilePictureUrl"] as? String,
            bannerPictureUrl: data["bannerPictureUrl"] as? String
        )
    }
}
    


extension Sequence {
    func asyncCompactMap<T>(
        _ transform: (Element) async -> T?
    ) async -> [T] {
        var values = [T]()
        
        for element in self {
            if let newElement = await transform(element) {
                values.append(newElement)
            }
        }
        return values
    }
}
