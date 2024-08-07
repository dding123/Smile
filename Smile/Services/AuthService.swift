//
//  AuthService.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation
import Combine
import FirebaseAuth

enum AuthError: Error {
    case signUpFailed(String)
    case signInFailed(String)
    case signOutFailed(String)
}

class AuthService: ObservableObject {
    @Published var currentUser: User?
    
    private var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?
    
    init() {
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener { [weak self] (_, firebaseUser) in
            if let firebaseUser = firebaseUser {
                self?.currentUser = User(id: firebaseUser.uid, email: firebaseUser.email ?? "", username: firebaseUser.displayName ?? "")
            } else {
                self?.currentUser = nil
            }
        }
    }
    
    deinit {
        if let handle = authStateDidChangeListenerHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    func signUp(email: String, password: String, username: String) -> AnyPublisher<User, AuthError> {
        return Future { promise in
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    promise(.failure(.signUpFailed(error.localizedDescription)))
                    return
                }
                
                guard let authResult = authResult else {
                    promise(.failure(.signUpFailed("Unknown error occurred")))
                    return
                }
                
                let changeRequest = authResult.user.createProfileChangeRequest()
                changeRequest.displayName = username
                changeRequest.commitChanges { (error) in
                    if let error = error {
                        promise(.failure(.signUpFailed(error.localizedDescription)))
                        return
                    }
                    
                    let user = User(id: authResult.user.uid, email: email, username: username)
                    promise(.success(user))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signIn(email: String, password: String) -> AnyPublisher<User, AuthError> {
        return Future { promise in
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    promise(.failure(.signInFailed(error.localizedDescription)))
                    return
                }
                
                guard let authResult = authResult else {
                    promise(.failure(.signInFailed("Unknown error occurred")))
                    return
                }
                
                let user = User(id: authResult.user.uid, email: authResult.user.email ?? "", username: authResult.user.displayName ?? "")
                promise(.success(user))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signOut() -> AnyPublisher<Void, AuthError> {
        return Future { promise in
            do {
                try Auth.auth().signOut()
                promise(.success(()))
            } catch {
                promise(.failure(.signOutFailed(error.localizedDescription)))
            }
        }
        .eraseToAnyPublisher()
    }
}
