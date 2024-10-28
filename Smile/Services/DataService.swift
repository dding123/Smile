//
//  DataService.swift
//  Smile
//
//  Created by David Ding on 9/18/24.
//

import Foundation
import Combine

protocol DataService {
    func signIn(email: String, password: String) -> AnyPublisher<User, Error>
    func signUp(email: String, password: String, username: String, firstName: String, lastName: String) -> AnyPublisher<User, Error>
    func signOut() -> AnyPublisher<Void, Error>
    func uploadImage(_ data: Data) -> AnyPublisher<URL, Error>
    func createPost(userId: String, username: String, imageUrl: URL, caption: String, taggedUsers: [String]) -> AnyPublisher<Void, Error>
    func searchUsers(matching query: String) -> AnyPublisher<[UserPreview], Error>
    func uploadProfileImage(_ data: Data, path: String) async throws -> URL
    func updateUserProfileImage(userId: String, imageUrl: String, type: ProfileImageType) async throws
}
