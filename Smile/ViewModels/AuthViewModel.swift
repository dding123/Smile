//
//  AuthViewModel.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var authError: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let dataService: DataService
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
        print("AuthViewModel initialized")
    }
    
    var isAuthenticated: Bool {
        return currentUser != nil
    }
    
    func signUp(email: String, password: String, username: String) {
        
        dataService.signUp(email: email, password: password, username: username)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.authError = error.localizedDescription
                }
            }, receiveValue: { [weak self] user in
                self?.currentUser = user
                self?.authError = ""
            })
            .store(in: &cancellables)
    }
    
    func signIn(email: String, password: String) {
        print("Attempting to sign in with email: \(email)")
        dataService.signIn(email: email, password: password)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    print("Sign in process completed")
                case .failure(let error):
                    print("Sign in error: \(error.localizedDescription)")
                    self?.authError = error.localizedDescription
                }
            }, receiveValue: { [weak self] user in
                print("Sign in successful. User: \(user)")
                self?.currentUser = user
                self?.authError = ""
            })
            .store(in: &cancellables)
    }
    
    func signOut() {
        dataService.signOut()
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.authError = error.localizedDescription
                }
            }, receiveValue: { [weak self] _ in
                self?.currentUser = nil
                self?.authError = ""
            })
            .store(in: &cancellables)
    }
}
