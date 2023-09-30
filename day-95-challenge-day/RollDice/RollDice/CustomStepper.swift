//
//  CustomStepper.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 29.09.2023.
//

import SwiftUI

struct CustomStepper: View {
    @Binding var value: Int
    
    var range: [Int]
    
    var body: some View {
        HStack {
            Button(action: { decrement() }, label: {
                Image(systemName: "minus")
            })
            .disabled(value == range.first)
            Text("\(value)")
                .frame(width: 50)
            Button(action: { increment() }, label: {
                Image(systemName: "plus")
            })
            .disabled(value == range.last)
        }
        .buttonStyle(BlackGrayButtonStyle())
        .font(.title)
        .animation(.bouncy, value: value)
    }
    
    func increment() {
        if let nextValue = range.first(where: { $0 > value }) {
            value = nextValue
            Haptic.feedback()
        }
    }
    
    func decrement() {
        if let previousValue = range.last(where: { $0 < value }) {
            value = previousValue
            Haptic.feedback()
        }
    }
}

#Preview {
    CustomStepper(value: .constant(100), range: Dice.DiceSides.allCases.map { $0.rawValue })
}
