//
//  App.swift
//  Smile
//
//  Created by David Ding on 10/27/24.
//

import SwiftUI

struct App: View {
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


struct App_Previews: PreviewProvider {
    static var previews: some View {
        App()
            .environmentObject(AuthViewModel())
    }
}
