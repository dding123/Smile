//
//  GroupsView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI

struct GroupsView: View {
    @StateObject private var viewModel = GroupsViewModel()
    @State private var showingCreateGroup = false
    @State private var searchText = ""
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search bar
                searchBar
                
                // Groups grid
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.filteredGroups) { group in
                            NavigationLink(destination: GroupDetailView(group: group)) {
                                GroupCell(group: group)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("My Groups")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingCreateGroup = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingCreateGroup) {
                CreateGroupView(onGroupCreated: {
                    Task {
                        await viewModel.fetchGroups()
                    }
                })
                .presentationDetents([.height(250)])
            }
            .task {
                await viewModel.fetchGroups()  // Initial fetch
            }
        }
    }
    
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search groups", text: $searchText)
                .textFieldStyle(.plain)
            
            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding()
    }
}

struct GroupCell: View {
    let group: UserGroup

    var body: some View {
        VStack {
            // Group photo
            AsyncImage(url: URL(string: group.photoUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "person.3.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.gray)
                    .frame(width: 80, height: 80)
                    .background(Color(.systemGray6))
            }
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Group name
            Text(group.name)
                .font(.system(size: 16, weight: .semibold))
                .lineLimit(1)
            
            // Member count
            Text("\(group.memberCount) members")
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
    }
}

// Group model
struct UserGroup: Identifiable {
    let id: String
    let name: String
    let photoUrl: String?
    let memberCount: Int
    let createdAt: Date
    let createdBy: String
}

// ViewModel
@MainActor
class GroupsViewModel: ObservableObject {
    @Published var groups: [UserGroup] = []
    @Published var searchText = ""
    private let dataService: DataService
    
    var filteredGroups: [UserGroup] {
        guard !searchText.isEmpty else { return groups }
        return groups.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
        Task {
            await fetchGroups()
        }
    }
    
    func fetchGroups() async {
        do {
            self.groups = try await dataService.fetchUserGroups()
        } catch {
            print("Error fetching groups: \(error)")
        }
    }
}

// Placeholder for group detail view
struct GroupDetailView: View {
    let group: UserGroup
    
    var body: some View {
        Text("Group Detail View - Coming Soon")
            .navigationTitle(group.name)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
