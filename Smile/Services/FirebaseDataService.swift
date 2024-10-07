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
            guard let currentUser = Auth.auth().currentUser else {
                let error = NSError(domain: "FirebaseDataService", code: 0, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
                print("Error: User not logged in")
                promise(.failure(error))
                return
            }
            
            print("Attempting to create post for user: \(currentUser.uid)")
            
            let db = Firestore.firestore()
            let postRef = db.collection("posts").document()
            
            let postData: [String: Any] = [
                "userId": currentUser.uid,
                "imageUrl": imageUrl.absoluteString,
                "caption": caption,
                "taggedUsers": taggedUsers,
                "createdAt": FieldValue.serverTimestamp()
            ]
            
            postRef.setData(postData) { error in
                if let error = error {
                    print("Error creating post: \(error.localizedDescription)")
                    promise(.failure(error))
                } else {
                    print("Post created successfully with ID: \(postRef.documentID)")
                    promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        Future { promise in
            let db = Firestore.firestore()
            db.collection("posts").order(by: "createdAt", descending: true).getDocuments { (snapshot, error) in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                
                let posts = snapshot?.documents.compactMap { document -> Post? in
                    let data = document.data()
                    return Post(
                        id: document.documentID,
                        userId: data["userId"] as? String ?? "",
                        imageUrl: data["imageUrl"] as? String ?? "",
                        caption: data["caption"] as? String ?? "",
                        taggedUsers: data["taggedUsers"] as? [String] ?? [],
                        createdAt: (data["createdAt"] as? Timestamp)?.dateValue() ?? Date()
                    )
                } ?? []
                
                promise(.success(posts))
            }
        }.eraseToAnyPublisher()
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
                    
                    let user = User(id: firebaseUser.uid, email: email, username: username)
                    promise(.success(user))
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
