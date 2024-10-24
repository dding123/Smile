//
//  LoginView.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import SwiftUI
import Combine

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var isSignUp = false
    @State private var username = ""
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        NavigationView {
            Form {
                
                if !isSignUp {
                    Section(header: Text("Login")) {
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        SecureField("Password", text: $password)
                    }
                }
                
                if isSignUp {
                    Section(header: Text("Sign Up Details")) {
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        SecureField("Password", text: $password)
                        TextField("Username", text: $username)
                            .autocapitalization(.none)
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                    }
                }
                
                Section {
                    Button(isSignUp ? "Sign Up" : "Sign In") {
                        if isSignUp {
                            viewModel.signUp(
                                email: email,
                                password: password,
                                username: username,
                                firstName: firstName,
                                lastName: lastName
                            )
                        } else {
                            viewModel.signIn(email: email, password: password)
                        }
                    }
                }
                
                Section {
                    Button(isSignUp ? "Already have an account? Sign In" : "Don't have an account? Sign Up") {
                        isSignUp.toggle()
                    }
                }
                
            }
            .navigationTitle(isSignUp ? "Sign Up" : "Sign In")
            .alert(item: Binding<AuthErrorWrapper?>(
                get: {
                    viewModel.authError.isEmpty ? nil : AuthErrorWrapper(error: viewModel.authError)
                },
                set: { _ in viewModel.authError = "" }
            )) { errorWrapper in
                Alert(title: Text("Error"), message: Text(errorWrapper.error))
            }
        }
    }
}

struct AuthErrorWrapper: Identifiable {
    let id = UUID()
    let error: String
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
