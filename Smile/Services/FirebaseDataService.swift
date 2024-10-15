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

    func createPost(imageUrl: URL, caption: String, taggedUsers: [String]) -> AnyPublisher<Void, Error> {
        Future { promise in
            Task {
                do {
                    guard let currentUser = Auth.auth().currentUser else {
                        throw NSError(domain: "FirebaseDataService", code: 0, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
                    }
                    
                    print("Attempting to create post for user: \(currentUser.uid)")
                    print("Tagged Users: \(taggedUsers)")
                    
                    // Fetch the current user's username
                    let db = Firestore.firestore()
                    let userDoc = try await db.collection("users").document(currentUser.uid).getDocument()
                    
                    guard let username = userDoc.data()?["username"] as? String else {
                        throw NSError(domain: "FirebaseDataService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Username not found"])
                    }
                    
                    let postRef = db.collection("posts").document()
                    
                    let postData: [String: Any] = [
                        "userId": currentUser.uid,
                        "username": username,
                        "imageUrl": imageUrl.absoluteString,
                        "caption": caption,
                        "taggedUsers": taggedUsers,
                        "createdAt": FieldValue.serverTimestamp(),
                        "likeCount": 0,
                        "commentCount": 0
                    ]
                    
                    try await postRef.setData(postData)
                    
                    print("Post created successfully with ID: \(postRef.documentID)")
                    print("Post data: \(postData)")
                    promise(.success(()))
                } catch {
                    print("Error creating post: \(error.localizedDescription)")
                    promise(.failure(error))
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
                
                // Implement User initialization from Firebase User
                let user = User(id: firebaseUser.uid, email: firebaseUser.email ?? "", username: firebaseUser.displayName ?? "")
                promise(.success(user))
            }
        }.eraseToAnyPublisher()
    }
    
    func signUp(email: String, password: String, username: String) -> AnyPublisher<User, Error> {
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
                        "createdAt": FieldValue.serverTimestamp(),
                        "lastLoginAt": FieldValue.serverTimestamp()
                    ]
                    
                    db.collection("users").document(firebaseUser.uid).setData(userData) { error in
                        if let error = error {
                            promise(.failure(error))
                        } else {
                            let user = User(id: firebaseUser.uid, email: email, username: username)
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
