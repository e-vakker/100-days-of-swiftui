//
//  Model.swift
//  Edutainment
//
//  Created by Jevgeni Vakker on 14.07.2023.
//

import Foundation
import SwiftUI


enum GameTypes: String, CaseIterable {
    case multiplication = "✖️"
    case division = "➗"
    case addition = "➕"
    case subtraction = "➖"
    
    var displayTitle: String {
        var title: String = ""
        switch self {
        case .addition:
            title = "Addition"
        case .multiplication:
            title = "Multiplication"
        case .division:
            title = "Division"
        case .subtraction:
            title = "Subtraction"
        }
        return "\(title) mode"
    }
    
    var operatorSymbol: String {
        var title: String = ""
        switch self {
        case .addition:
            title = "+"
        case .multiplication:
            title = "×"
        case .division:
            title = "÷"
        case .subtraction:
            title = "-"
        }
        return title
    }
}

enum TotalGames: Int, CaseIterable {
    case five = 5
    case ten = 10
    case twenty = 20
    
    var displayText: String {
        "\(self.rawValue) games"
    }
    
    var numberOfGames: Int {
        self.rawValue
    }
}

enum GameDifficulty: String, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var displayText: String {
        "\(self.rawValue) difficulty"
    }
}

let avatar: [Image] = [
    Image("bear"), Image("buffalo"), Image("chick"),
    Image("chicken"), Image("cow"), Image("crocodile"),
    Image("dog"), Image("duck"), Image("elephant"),
    Image("frog"), Image("giraffe"), Image("goat"),
    Image("gorilla"), Image("hippo"), Image("horse"),
    Image("monkey"), Image("moose"), Image("narwhal"),
    Image("owl"), Image("panda"), Image("parrot"),
    Image("penguin"), Image("pig"), Image("rabbit"),
    Image("rhino"), Image("sloth"), Image("snake"),
    Image("walrus"), Image("whale"), Image("zebra")
]

struct Equation {
    let operand1: Int
    let operand2: Int
    let operatorSymbol: String
    let result: Int
}

struct Game {
    var games: TotalGames
    let difficulty: GameDifficulty
    let type: GameTypes
    let name: String
    let avatar: Image
    var score: Int = 0
    var equations: [Equation] = []
    
    
    mutating func makeGames() {
        for _ in 0..<games.numberOfGames {
            let operand1 = operand()
            let operand2 = operand()
            let result = calculateResult(operand1: operand1, operand2: operand2)
            equations.append(Equation(operand1: operand1, operand2: operand2, operatorSymbol: type.operatorSymbol, result: result))
        }
    }
    
    mutating func checkResult(result: String) {
        if Int(result) == equations.first?.result {
            score += 10
            equations.remove(at: 0)
        } else {
            score -= 10
            equations.remove(at: 0)
        }
    }
    
    func calculateResult(operand1: Int, operand2: Int) -> Int {
        switch type {
        case .addition:
            return operand1 + operand2
        case .subtraction:
            return operand1 - operand2
        case .multiplication:
            return operand1 * operand2
        case .division:
            guard operand1 != 0 && operand2 != 0 else { return 0 }
            return operand1 / operand2
        }
    }
    
    func operand() -> Int {
        switch difficulty {
        case .easy:
            return Int.random(in: 0...10)
        case .medium:
            return Int.random(in: 0...999)
        case .hard:
            return Int.random(in: -9999...9999)
        }
    }
    
}
