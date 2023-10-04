//
//  Card.swift
//  Flashzilla
//
//  Created by Jevgeni Vakker on 21.09.2023.
//

import Foundation


struct Card: Codable, Identifiable {
    var id = UUID()
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    
    static func loadData() -> [Card] {
        var cards:[Card] = []
        
        do {
            let data = try Data(contentsOf: FileManager.documentDirectory)
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
                return cards
            }
        } catch {
            return cards
        }
        
        return cards
    }
    
    static func saveData(cards: [Card]) {
        do {
            let data = try JSONEncoder().encode(cards)
            try data.write(to: FileManager.documentDirectory)
        } catch {
            print("The data was not saved: \(error.localizedDescription)")
        }
    }
}
