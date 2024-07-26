//
//  TagView.swift
//  Day60Challenge
//
//  Created by Ayrton Parkinson on 2024/07/25.
//

import SwiftUI

struct TagView: View {
    var tags: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(tags, id: \.self) {
                    Text($0)
                        .padding(.all, 5)
                        .background(.blue)
                        .clipShape(.capsule)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    TagView(tags: ["Cool", "Awesome", "Nasty", "Epic", "Nerdy", "PogChamp", "Crazy"])
}
