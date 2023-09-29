//
//  Haptic.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 29.09.2023.
//

import SwiftUI

class Haptic {
    static func feedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}
