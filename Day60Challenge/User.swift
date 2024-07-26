//
//  User.swift
//  Day60Challenge
//
//  Created by Ayrton Parkinson on 2024/07/25.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: String
    var isActive: Bool
    var name: String
    var age: Int
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    var registrationDate: String {
        registered.formatted(date: .abbreviated, time: .omitted)
    }
}
