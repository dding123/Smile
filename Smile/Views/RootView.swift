//
//  RootView.swift
//  Smile
//
//  Created by David Ding on 10/27/24.
//


import SwiftUI

struct RootView: View {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                TabNavigator()
            } else {
                LoginView()
            }
        }
        .environmentObject(authViewModel)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(AuthViewModel())
    }
}