//
//  Divider.swift
//  Day60Challenge
//
//  Created by Ayrton Parkinson on 2024/07/25.
//

import SwiftUI

struct Divider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.secondary)
            .padding(.vertical)
    }
}

#Preview {
    Divider()
}
