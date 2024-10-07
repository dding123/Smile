//
//  DataService.swift
//  Smile
//
//  Created by David Ding on 9/18/24.
//

import Combine
import Foundation

protocol DataService {
    func uploadImage(_ data: Data) -> AnyPublisher<URL, Error>
    func createPost(imageUrl: URL, caption: String, taggedUsers: [String]) -> AnyPublisher<Void, Error>
    func fetchPosts() -> AnyPublisher<[Post], Error>
    func signIn(email: String, password: String) -> AnyPublisher<User, Error>
    func signUp(email: String, password: String, username: String) -> AnyPublisher<User, Error>
    func signOut() -> AnyPublisher<Void, Error>
}
