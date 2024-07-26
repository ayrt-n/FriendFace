//
//  StatusIndicator.swift
//  Day60Challenge
//
//  Created by Ayrton Parkinson on 2024/07/25.
//

import SwiftUI

struct StatusIndicator: View {
    var isActive: Bool
    
    var body: some View {
        if isActive {
            HStack {
                Image(systemName: "person.crop.circle.fill.badge.checkmark")
                Text("Online")
            }
            .foregroundColor(.green)
        } else {
            HStack {
                Image(systemName: "person.crop.circle.fill.badge.xmark")
                Text("Offline")
            }
            .foregroundColor(.red)
        }
    }
}

#Preview {
    StatusIndicator(isActive: false)
}
