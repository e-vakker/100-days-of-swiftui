//
//  BlackGrayButtonStyle.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 30.09.2023.
//

import SwiftUI

struct BlackGrayButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(isEnabled ? .black : .gray)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
}
