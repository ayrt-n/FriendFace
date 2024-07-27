//
//  Friend.swift
//  Day60Challenge
//
//  Created by Ayrton Parkinson on 2024/07/25.
//

import Foundation
import SwiftData

@Model
class Friend: Codable, Hashable {
    enum CodingKeys: CodingKey {
        case id, name
    }
    
    let id: String
    var name: String
    var friendOf: User?
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
}
