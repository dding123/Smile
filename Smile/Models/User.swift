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
    let firstName: String
    let lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
