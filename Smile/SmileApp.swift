//
//  SmileApp.swift
//  Smile
//
//  Created by David Ding on 7/18/23.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct SmileApp: App {
    @StateObject private var appState = AppState()
    @StateObject private var authViewModel = AuthViewModel()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
                .environmentObject(authViewModel)
        }
    }
}
