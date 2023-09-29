//
//  ContentView.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 28.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var stepperValue = 4
    
    let diceSlides = Dice.DiceSides.allCases.map { $0.rawValue }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Roll Dice")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                    .fontDesign(.monospaced)
                HStack {
                    CustomStepper(value: $stepperValue, range: diceSlides)
                    Spacer()
                    Button(action: {
                        Haptic.feedback()
                    }) {
                        Text("Add")
                            .padding(30)
                            .background(.ultraThickMaterial)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .strokeBorder(.quaternary, lineWidth: 0.5)
                            }
                    }
                    .buttonStyle(BlackGrayButtonStyle())
                }
                
                Spacer()
            }
            VStack {
                Text("55")
                    .font(.system(size: 100, design: .monospaced))
                    .foregroundStyle(.black)
                
                Text("Total: 55")
                    .font(.title)
                    .foregroundStyle(.black)
                    .fontWeight(.heavy)
                    .fontDesign(.monospaced)
                    .padding(25)
                    .background(.thickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            }
            
            VStack {
                Spacer()
                Button(action: { }) {
                    Text("Roll")
                        .font(.title)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    
                }
            }
        }
        .padding()
    }
}

#Preview("Main View") {
    ContentView()
}
