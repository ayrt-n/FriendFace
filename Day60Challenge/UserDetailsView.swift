//
//  UserDetailsView.swift
//  Day60Challenge
//
//  Created by Ayrton Parkinson on 2024/07/25.
//

import SwiftUI
import SwiftData

struct UserDetailsView: View {
    var user: User
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.title)
                        .fontWeight(.bold)
                    StatusIndicator(isActive: user.isActive)
                        .padding(.bottom, 1)
                    Text("Member since \(user.registrationDate)")
                        .font(.caption)
                }
                
                Divider()
                
                Text(user.about)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.horizontal)
            
            TagView(tags: user.tags)
            
            VStack(alignment: .leading) {
                Divider()
                
                Text("Friends")
                    .font(.title2)
                    .fontWeight(.bold)
                
                ForEach(user.friends) {friend in
                    Text(friend.name)
                        .padding(.vertical, 1)
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, Friend.self, configurations: config)
        
        let isoDate = "2015-11-10T01:47:18-00:00"
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from: isoDate)!
        
        let f1 = Friend(id: "1", name: "Vicky")
        let f2 = Friend(id: "2", name: "Monty")
        let f3 = Friend(id: "3", name: "Emmett")
        
        let user = User(id: "1", isActive: true, name: "Ayrton", age: 30, email: "ap@gmail.com", address: "10 Nowhere St", about: "Likes stuff", registered: date, tags: ["Cool", "Awesome"], friends: [])
        
        return UserDetailsView(user: user)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
