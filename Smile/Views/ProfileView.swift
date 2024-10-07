//
//  ProfileView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showingLogoutAlert = false

    var body: some View {
        NavigationView {
            VStack {
                // Your existing profile content here
                Text("Profile View")
                    .font(.title)
                    .padding()

                // Add more profile information and settings as needed

                Spacer()

                Button(action: {
                    showingLogoutAlert = true
                }) {
                    Text("Log Out")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Profile")
            .alert(isPresented: $showingLogoutAlert) {
                Alert(
                    title: Text("Log Out"),
                    message: Text("Are you sure you want to log out?"),
                    primaryButton: .destructive(Text("Log Out")) {
                        authViewModel.signOut()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}
