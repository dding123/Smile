//
//  CreateGroupView.swift
//  Smile
//
//  Created by David Ding on 11/9/24.
//
import SwiftUI

struct CreateGroupView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = CreateGroupViewModel()
    @State private var groupName = ""
    var onGroupCreated: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("New Group")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Enter a name for the group")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            TextField("Group name", text: $groupName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            HStack(spacing: 20) {
                Button("Cancel") {
                    dismiss()
                }
                .buttonStyle(.bordered)
                
                Button("Create") {
                    Task {
                        await viewModel.createGroup(name: groupName)
                        onGroupCreated()  // Call the refresh callback
                        dismiss()
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(groupName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 10)
        .onAppear {
            viewModel.onGroupCreated = onGroupCreated
        }
    }
}

@MainActor
class CreateGroupViewModel: ObservableObject {
    private let dataService: DataService
    var onGroupCreated: (() -> Void)?
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
    }
    
    func createGroup(name: String) async {
        do {
            _ = try await dataService.createGroup(name: name)
            onGroupCreated?()  // Notify that a group was created
        } catch {
            print("Error creating group: \(error)")
        }
    }
}
