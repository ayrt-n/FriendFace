//
//  ContentView.swift
//  Day60Challenge
//
//  Created by Ayrton Parkinson on 2024/07/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    UserListRow(user: user)
                }
            }
            .navigationDestination(for: User.self) { user in
                UserDetailsView(user: user)
            }
            .navigationTitle("Users")
        }
        .task {
            await fetchUserData()
        }
    }
    
    func fetchUserData() async {
        if !users.isEmpty {
            print("Already have users")
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            print("Getting users from interweb")
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let insertContext = ModelContext(modelContext.container)
            
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                for user in decodedResponse {
                    insertContext.insert(user)
                }
            }
            
            try insertContext.save()
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
    
        return ContentView()
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
