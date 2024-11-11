//
//  Post.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    let userId: String
    let username: String
    let imagePath: String
    let caption: String
    let taggedUsers: [String]
    @ServerTimestamp var createdAt: Date?
    let likeCount: Int
    let commentCount: Int
    
    var uniqueId: String {
        id ?? "\(userId)-\(createdAt?.timeIntervalSince1970 ?? 0)"
    }
    
    // Default memberwise initializer for creating posts
    init(
        id: String? = nil,
        userId: String,
        username: String,
        imagePath: String,
        caption: String,
        taggedUsers: [String] = [],
        createdAt: Date? = nil,
        likeCount: Int = 0,
        commentCount: Int = 0
    ) {
        self.id = id
        self.userId = userId
        self.username = username
        self.imagePath = imagePath
        self.caption = caption
        self.taggedUsers = taggedUsers
        self.createdAt = createdAt
        self.likeCount = likeCount
        self.commentCount = commentCount
    }
}

// Separate extension for Codable implementation
extension Post {
    enum CodingKeys: String, CodingKey {
        case id, userId, username, imagePath, caption, taggedUsers, createdAt, likeCount, commentCount
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.username = try container.decode(String.self, forKey: .username)
        self.imagePath = try container.decode(String.self, forKey: .imagePath)
        self.caption = try container.decode(String.self, forKey: .caption)
        self.taggedUsers = try container.decode([String].self, forKey: .taggedUsers)
        self.createdAt = try container.decodeIfPresent(Date.self, forKey: .createdAt)
        self.likeCount = try container.decodeIfPresent(Int.self, forKey: .likeCount) ?? 0
        self.commentCount = try container.decodeIfPresent(Int.self, forKey: .commentCount) ?? 0
    }
}

// Separate helper struct for image handling
struct PostImage {
    enum PostImageError: Error {
        case invalidPath
        case downloadFailed(Error)
        
        var localizedDescription: String {
            switch self {
            case .invalidPath:
                return "Invalid image path"
            case .downloadFailed(let error):
                return "Failed to download image: \(error.localizedDescription)"
            }
        }
    }
    
    static func getURL(for path: String) async throws -> URL {
        // If the path is already a full URL string, try to use it directly
        if let url = URL(string: path), url.scheme != nil {
            return url
        }
        
        guard !path.isEmpty else {
            throw PostImageError.invalidPath
        }
        
        do {
            let storageRef = Storage.storage().reference().child(path)
            return try await storageRef.downloadURL()
        } catch {
            throw PostImageError.downloadFailed(error)
        }
    }
}
