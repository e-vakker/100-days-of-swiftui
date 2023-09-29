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
        
        let diceSlides = Dice.DiceSides.allCases.map { $0.rawValue }
        
        @Published private(set) var dices: [Dice] = []
        
        @Published private(set) var isDisabledAddDice = false
        
        func addDice() {
            guard dices.count < 6 else { return }
            
            if let diceSide = Dice.DiceSides(rawValue: diceSides) {
                let dice = Dice(sides: diceSide)
                dices.append(dice)
                total += dice.value
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
    }
}
