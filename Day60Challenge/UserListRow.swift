//
//  UserListRow.swift
//  Day60Challenge
//
//  Created by Ayrton Parkinson on 2024/07/26.
//

import SwiftUI

struct UserListRow: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.headline)
            StatusIndicator(isActive: user.isActive)
        }
    }
}

#Preview {
    let isoDate = "2015-11-10T01:47:18-00:00"
    let dateFormatter = ISO8601DateFormatter()
    let date = dateFormatter.date(from: isoDate)!
    
    return UserListRow(user: User(id: "1", isActive: true, name: "Ayrton", age: 30, email: "ap@gmail.com", address: "10 Nowhere St", about: "Likes stuff", registered: date, tags: ["Cool", "Awesome"], friends: []))
}
