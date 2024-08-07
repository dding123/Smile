//
//  AuthViewModel.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var authError: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let authService: AuthService
    
    init(authService: AuthService = AuthService()) {
        self.authService = authService
        
        authService.$currentUser
            .map { $0 != nil }
            .assign(to: \.isAuthenticated, on: self)
            .store(in: &cancellables)
    }
    
    func signUp(email: String, password: String, username: String) {
        authService.signUp(email: email, password: password, username: username)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.authError = error.localizedDescription
                }
            }, receiveValue: { _ in
                self.authError = ""
            })
            .store(in: &cancellables)
    }
    
    func signIn(email: String, password: String) {
        authService.signIn(email: email, password: password)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.authError = error.localizedDescription
                }
            }, receiveValue: { _ in
                self.authError = ""
            })
            .store(in: &cancellables)
    }
    
    func signOut() {
        authService.signOut()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.authError = error.localizedDescription
                }
            }, receiveValue: { _ in
                self.authError = ""
            })
            .store(in: &cancellables)
    }
}
