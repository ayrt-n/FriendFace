//
//  Day60ChallengeApp.swift
//  Day60Challenge
//
//  Created by Ayrton Parkinson on 2024/07/25.
//

import SwiftData
import SwiftUI

@main
struct Day60ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
