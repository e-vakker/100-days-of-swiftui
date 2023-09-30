//
//  ContentView-ViewModel.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 29.09.2023.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var diceSides: Int = 4
        @Published private(set) var total: Int = 0
        @Published private(set) var isDisabledAddDice = false
        @Published private(set) var dices: [Dice] = []
        @Published var rollDicesHistory: [HistoryEntry] = []
        
        let diceSlides = Dice.DiceSides.allCases.map { $0.rawValue }
        
        init() {
            loadHistory()
        }
        
        func addDice() {
            guard dices.count < 6 else { return }
            
            if let diceSide = Dice.DiceSides(rawValue: diceSides) {
                let dice = Dice(sides: diceSide)
                dices.append(dice)
                total += dice.value
                addToHistory(value: dice.value)
                
            } else {
                print("Error: Invalid dice sides value \(diceSides)")
            }
            
            if dices.count == 6 {
                isDisabledAddDice = true
            }
        }
        
        func deleteDice(id: UUID) {
            if !dices.isEmpty {
                if let index = dices.firstIndex(where: { $0.id == id }) {
                    let removedDice = dices.remove(at: index)
                    total -= removedDice.value
                }
            }
            if dices.count < 6 {
                isDisabledAddDice = false
            }
        }
        
        func rollAllDices() {
            for index in dices.indices {
                let newDiceValue = Dice.roll(sides: dices[index].sides.rawValue)
                dices[index].value = newDiceValue
                addToHistory(value: newDiceValue)
                total = dices.reduce(0) { $0 + $1.value }
            }
        }
        
        func addToHistory(value: Int) {
            if rollDicesHistory.count < 500 {
                rollDicesHistory.append(HistoryEntry(value: value))
                saveHistoryToJson()
            } else {
                removeHistory()
            }
        }
        
        func removeHistory() {
            rollDicesHistory.removeAll()
            saveHistoryToJson()
        }
        
        private func saveHistoryToJson() {
            do {
                let jsonData = try JSONEncoder().encode(rollDicesHistory)
                try jsonData.write(to: FileManager.documentDirectoryFileURL)
                
            } catch {
                print("The data was not saved: \(error.localizedDescription)")
            }
        }
        
        private func loadHistory() {
            do {
                let jsonData = try Data(contentsOf: FileManager.documentDirectoryFileURL)
                if let decoded = try? JSONDecoder().decode([HistoryEntry].self, from: jsonData) {
                    rollDicesHistory = decoded
                }
            } catch {
                rollDicesHistory = []
            }
        }
    }
}
