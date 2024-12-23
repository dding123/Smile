//
//  SettingsView.swift
//  Smile
//
//  Created by David Ding on 12/22/24.
//
import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Button("Sign Out") {
                    Task {
                        await viewModel.signOut()
                    }
                }
                .foregroundColor(.red)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
