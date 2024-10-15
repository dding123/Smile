//
//  UserTests.swift
//  Smile
//
//  Created by David Ding on 10/14/24.
//

import Testing
@testable import Smile // Replace with your app name

@Suite("User Tests")
struct UserTests {
    @Test("User Initialization")
    func testUserInitialization() {
        let user = User(id: "123", email: "test@example.com", username: "testuser")
        #expect(user.id == "123")
        #expect(user.email == "test@example.com")
        #expect(user.username == "testuser")
    }
}
