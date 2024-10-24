//
//  UserPreview.swift
//  Smile
//
//  Created by David Ding on 10/22/24.
//
import Foundation

struct UserPreview: Identifiable, Hashable {
    let id: String
    let username: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: UserPreview, rhs: UserPreview) -> Bool {
        lhs.id == rhs.id
    }
}
