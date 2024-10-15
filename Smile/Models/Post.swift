//
//  Post.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation
import FirebaseFirestore

struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    var userId: String
    var username: String  // New field
    var imageUrl: String
    var caption: String
    var taggedUsers: [String]
    @ServerTimestamp var createdAt: Date?
    var likeCount: Int  // New field
    var commentCount: Int  // New field

    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case username
        case imageUrl
        case caption
        case taggedUsers
        case createdAt
        case likeCount
        case commentCount
    }

    init(userId: String, username: String, imageUrl: String, caption: String, taggedUsers: [String], likeCount: Int = 0, commentCount: Int = 0) {
        self.userId = userId
        self.username = username
        self.imageUrl = imageUrl
        self.caption = caption
        self.taggedUsers = taggedUsers
        self.likeCount = likeCount
        self.commentCount = commentCount
    }
}
