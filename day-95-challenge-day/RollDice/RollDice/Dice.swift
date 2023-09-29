//
//  Dice.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 28.09.2023.
//

import Foundation


struct Dice {
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
    
    let sides: DiceSides
    
    mutating func roll() {
        value = Int.random(in: 1...sides.rawValue)
    }
}
