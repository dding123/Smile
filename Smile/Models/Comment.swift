//
//  Untitled.swift
//  Smile
//
//  Created by David Ding on 10/28/24.
//

import Foundation
import FirebaseFirestore

struct Comment: Identifiable, Codable {
    @DocumentID var id: String?
    let userId: String
    let username: String
    let text: String
    @ServerTimestamp var createdAt: Date?
    
    var timeAgo: String {
        guard let date = createdAt else { return "" }
        // Simple time ago string
        let seconds = -Int(date.timeIntervalSinceNow)
        if seconds < 60 {
            return "just now"
        } else if seconds < 3600 {
            let minutes = seconds / 60
            return "\(minutes)m"
        } else if seconds < 86400 {
            let hours = seconds / 3600
            return "\(hours)h"
        } else {
            let days = seconds / 86400
            return "\(days)d"
        }
    }
}

struct LikeStatus {
    let isLiked: Bool
    let count: Int
}
