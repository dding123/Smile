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
    
    func uploadImage(_ data: Data) -> AnyPublisher<URL, Error> {
        Future { promise in
            let imageName = UUID().uuidString + ".jpg"
            let storageRef = Storage.storage().reference().child("post_images/\(imageName)")
            
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            
            storageRef.putData(data, metadata: metadata) { (metadata, error) in
                if let error = error {
                    print("Error uploading image: \(error.localizedDescription)")
                    promise(.failure(error))
                    return
                }
                
                print("Image uploaded successfully. Getting download URL...")
                storageRef.downloadURL { (url, error) in
                    if let error = error {
                        print("Error getting download URL: \(error.localizedDescription)")
                        promise(.failure(error))
                    } else if let downloadURL = url {
                        print("Download URL obtained: \(downloadURL)")
                        promise(.success(downloadURL))
                    } else {
                        let error = NSError(domain: "FirebaseDataService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get download URL"])
                        print("Error: Failed to get download URL")
                        promise(.failure(error))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }

    func createPost(userId: String, username: String, imageUrl: URL, caption: String, taggedUsers: [String]) -> AnyPublisher<Void, Error> {
        Future { promise in
            let db = Firestore.firestore()
            
            // Print the data we're trying to save for debugging
            print("Creating post with data - userId: \(userId), username: \(username), taggedUsers: \(taggedUsers)")
            
            let postData: [String: Any] = [
                "userId": userId,
                "username": username,  // Make sure this is included!
                "imageUrl": imageUrl.absoluteString,
                "caption": caption,
                "taggedUsers": taggedUsers,
                "createdAt": FieldValue.serverTimestamp(),
                "likeCount": 0,
                "commentCount": 0
            ]
            
            db.collection("posts").addDocument(data: postData) { error in
                if let error = error {
                    print("Error creating post: \(error.localizedDescription)")
                    promise(.failure(error))
                } else {
                    print("Post created successfully")
                    promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
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

    func signIn(email: String, password: String) -> AnyPublisher<User, Error> {
        Future { promise in
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                
                guard let firebaseUser = authResult?.user else {
                    promise(.failure(NSError(domain: "FirebaseDataService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get user"])))
                    return
                }
                
                // Fetch additional user data from Firestore
                let db = Firestore.firestore()
                db.collection("users").document(firebaseUser.uid).getDocument { (document, error) in
                    if let error = error {
                        promise(.failure(error))
                        return
                    }
                    
                    guard let document = document,
                          let data = document.data(),
                          let username = data["username"] as? String,
                          let firstName = data["firstName"] as? String,
                          let lastName = data["lastName"] as? String else {
                        promise(.failure(NSError(domain: "FirebaseDataService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get user data"])))
                        return
                    }
                    
                    let user = User(
                        id: firebaseUser.uid,
                        email: firebaseUser.email ?? email,
                        username: username,
                        firstName: firstName,
                        lastName: lastName
                    )
                    promise(.success(user))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func signUp(email: String, password: String, username: String, firstName: String, lastName: String) -> AnyPublisher<User, Error> {
            Future { promise in
                Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                    if let error = error {
                        promise(.failure(error))
                        return
                    }
                    
                    guard let firebaseUser = authResult?.user else {
                        promise(.failure(NSError(domain: "FirebaseDataService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get user"])))
                        return
                    }
                    
                    let changeRequest = firebaseUser.createProfileChangeRequest()
                    changeRequest.displayName = username
                    changeRequest.commitChanges { (error) in
                        if let error = error {
                            promise(.failure(error))
                            return
                        }
                        
                        // Create user document in Firestore
                        let db = Firestore.firestore()
                        let userData: [String: Any] = [
                            "username": username,
                            "email": email,
                            "firstName": firstName,
                            "lastName": lastName,
                            "createdAt": FieldValue.serverTimestamp()
                        ]
                        
                        db.collection("users").document(firebaseUser.uid).setData(userData) { error in
                            if let error = error {
                                promise(.failure(error))
                            } else {
                                let user = User(
                                    id: firebaseUser.uid,
                                    email: email,
                                    username: username,
                                    firstName: firstName,
                                    lastName: lastName
                                )
                                promise(.success(user))
                            }
                        }
                    }
                }
            }.eraseToAnyPublisher()
        }
    
    func signOut() -> AnyPublisher<Void, Error> {
        Future { promise in
            do {
                try Auth.auth().signOut()
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }

    func searchUsers(matching query: String) -> AnyPublisher<[UserPreview], Error> {
        let db = Firestore.firestore()
        
        return Future { promise in
            print("Starting Firestore query for: \(query)") // Debug print
            
            db.collection("users")
                .whereField("username", isGreaterThanOrEqualTo: query.lowercased())
                .whereField("username", isLessThan: query.lowercased() + "\u{f8ff}")
                .limit(to: 10)
                .getDocuments { snapshot, error in
                    if let error = error {
                        print("Firestore error: \(error.localizedDescription)") // Debug print
                        promise(.failure(error))
                        return
                    }
                    
                    guard let documents = snapshot?.documents else {
                        print("No documents found") // Debug print
                        promise(.success([]))
                        return
                    }
                    
                    let users = documents.compactMap { document -> UserPreview? in
                        guard let username = document.data()["username"] as? String else {
                            print("Failed to get username from document: \(document.documentID)") // Debug print
                            return nil
                        }
                        return UserPreview(id: document.documentID, username: username)
                    }
                    
                    print("Found \(users.count) matching users") // Debug print
                    promise(.success(users))
                }
        }
        .eraseToAnyPublisher()
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
