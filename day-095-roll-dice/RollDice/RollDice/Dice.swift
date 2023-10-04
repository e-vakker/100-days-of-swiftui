//
//  Dice.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 28.09.2023.
//

import Foundation


struct Dice: Hashable, Identifiable {
    var id = UUID()
    
    enum DiceSides: Int, CaseIterable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
    }
    
    var value: Int
    
    init(sides: DiceSides) {
        self.value = Dice.roll(sides: sides.rawValue)
        self.sides = sides
    }
    
    let sides: DiceSides
    
    static func roll(sides: Int) -> Int {
        return Int.random(in: 1...sides)
    }
}
