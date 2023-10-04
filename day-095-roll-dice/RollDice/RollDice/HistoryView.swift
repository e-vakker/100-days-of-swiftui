//
//  HistoryView.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 29.09.2023.
//

import SwiftUI

struct HistoryView: View {
    var rollDicesHistory: [HistoryEntry]
    
    let columns = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10, content: {
            ForEach(rollDicesHistory) { dice in
                Text("\(dice.value)")
                    .fontDesign(.monospaced)
            }
        })
        .offset(x: 0, y: -150)
        .rotationEffect(.degrees(45))
        .scaleEffect(2.0)
        .rotation3DEffect(
            .degrees(0), axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .opacity(0.1)
        .animation(.easeIn, value: rollDicesHistory)
        
    }
}

#Preview {
    HistoryView(rollDicesHistory: HistoryEntry.sampleData())
}
