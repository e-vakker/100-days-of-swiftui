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
}

enum TotalGames: Int, CaseIterable {
    case five = 5
    case ten = 10
    case twenty = 20
    
    var displayText: String {
        "\(self.rawValue) games"
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

struct Game {
    var games: TotalGames
    let difficulty: GameDifficulty
    let type: GameTypes
    let name: String
    let avatar: Image
}
