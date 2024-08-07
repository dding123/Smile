//
//  User.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    var username: String
    // Add other user properties as needed
}
