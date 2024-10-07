//
//  Post.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation
import FirebaseFirestore

struct Post: Identifiable, Codable {
    var id: String
    var userId: String
    var imageUrl: String
    var caption: String
    var taggedUsers: [String]
    var createdAt: Date
    
    init(id: String, userId: String, imageUrl: String, caption: String, taggedUsers: [String], createdAt: Date? = nil) {
        self.id = id
        self.userId = userId
        self.imageUrl = imageUrl
        self.caption = caption
        self.taggedUsers = taggedUsers
        self.createdAt = createdAt ?? Date()
    }
}
