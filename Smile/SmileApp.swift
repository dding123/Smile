//
//  SmileApp.swift
//  Smile
//
//  Created by David Ding on 7/18/23.
//

import SwiftUI
import FirebaseCore

@main
struct SmileApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
