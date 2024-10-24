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
    var username: String
    var imageUrl: String
    var caption: String
    var taggedUsers: [String]
    @ServerTimestamp var createdAt: Date?
    var likeCount: Int
    var commentCount: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        print("Decoding post. Available keys: \(container.allKeys)")
        
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.username = try container.decode(String.self, forKey: .username)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.caption = try container.decode(String.self, forKey: .caption)
        self.taggedUsers = try container.decode([String].self, forKey: .taggedUsers)
        self.createdAt = try container.decodeIfPresent(Date.self, forKey: .createdAt)
        self.likeCount = try container.decodeIfPresent(Int.self, forKey: .likeCount) ?? 0
        self.commentCount = try container.decodeIfPresent(Int.self, forKey: .commentCount) ?? 0
    }
}
