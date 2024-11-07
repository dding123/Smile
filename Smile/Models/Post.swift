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
    var userId: String
    var username: String
    var imagePath: String
    var caption: String
    var taggedUsers: [String]
    @ServerTimestamp var createdAt: Date?
    var likeCount: Int
    var commentCount: Int
    
    var uniqueId: String {
        if let id = id {
            return id
        }
        // Include more unique information if ID is nil
        return "\(userId)-\(createdAt?.timeIntervalSince1970 ?? 0)"
    }
    
    // Custom Codable implementation to handle the imagePath
    enum CodingKeys: String, CodingKey {
        case id, userId, username, imagePath, caption, taggedUsers, createdAt, likeCount, commentCount
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
//        print("Decoding post. Available keys: \(container.allKeys)")
        
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

// Helper struct to manage image loading
struct PostImage {
    static func getURL(for path: String) async throws -> URL {
        // If the path is already a full URL string, try to use it directly
        if let url = URL(string: path), url.scheme != nil {
            return url
        }
        
        print("Getting download URL for path: \(path)")
        let storageRef = Storage.storage().reference().child(path)
        
        do {
            let url = try await storageRef.downloadURL()
            print("Successfully got download URL: \(url)")
            return url
        } catch {
            print("Error getting download URL: \(error)")
            throw error
        }
    }
}
