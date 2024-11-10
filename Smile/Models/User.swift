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
    private var _username: String
    let firstName: String
    let lastName: String
    var profilePictureUrl: String?
    var bannerPictureUrl: String?
    
    var username: String {
        get { _username.lowercased() }
        set { _username = newValue.lowercased() }
    }
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case _username = "username"
        case firstName
        case lastName
        case profilePictureUrl
        case bannerPictureUrl
    }
    
    // Add custom init to handle the username property
    init(id: String, email: String, username: String, firstName: String, lastName: String, profilePictureUrl: String? = nil, bannerPictureUrl: String? = nil) {
        self.id = id
        self.email = email
        self._username = username.lowercased()
        self.firstName = firstName
        self.lastName = lastName
        self.profilePictureUrl = profilePictureUrl
        self.bannerPictureUrl = bannerPictureUrl
    }
}
