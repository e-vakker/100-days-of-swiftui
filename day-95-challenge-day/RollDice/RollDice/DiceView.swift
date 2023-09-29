//
//  DiceView.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 29.09.2023.
//

import SwiftUI

struct DiceView: View {
    let value: Int
    
    @State private var visibleValue = 0
    
    var body: some View {
        Text("\(visibleValue)")
            .font(.system(size: 90))
            .fontDesign(.monospaced)
            .foregroundStyle(.black)
            .onAppear {
                Task {
                    await animateValueChange()
                }
            }
            .onChange(of: value) {
                Task {
                    await animateValueChange()
                }
            }
    }
    
    private func animateValueChange() async {
        
        let increment: Int
        if value > visibleValue {
            increment = 1
        } else if value < visibleValue {
            increment = -1
        } else {
            return
        }
        
        for newValue in stride(from: visibleValue, through: value, by: increment) {
            visibleValue = newValue
            do {
                try await Task.sleep(nanoseconds: 10_000_000)
            } catch {
                visibleValue = value
            }
            
        }
    }
}

#Preview {
    DiceView(value: 20)
}
