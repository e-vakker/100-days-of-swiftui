//
//  HistoryEntry.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 30.09.2023.
//

import Foundation

struct HistoryEntry: Codable, Identifiable, Hashable {
    var id = UUID()
    let value: Int
    
    static func sampleData() -> [HistoryEntry] {
        var history:[HistoryEntry] = []
        for _ in 0...200 {
            history.append(HistoryEntry(value: Int.random(in: 1...100)))
        }
        return history
    }
}
