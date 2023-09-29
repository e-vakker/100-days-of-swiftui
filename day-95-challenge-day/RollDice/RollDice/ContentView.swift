//
//  ContentView.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 28.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            VStack {
                Text("Roll Dice")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                    .fontDesign(.monospaced)
                
                Text("Total: \(viewModel.total)")
                    .font(.title)
                    .foregroundStyle(.black)
                    .fontWeight(.heavy)
                    .fontDesign(.monospaced)
                    .padding(25)
                    .background(.thickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                
                HStack {
                    CustomStepper(value: $viewModel.diceSides, range: viewModel.diceSlides)
                    Spacer()
                    Button(action: {
                        viewModel.addDice()
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
                    .disabled(viewModel.isDisabledAddDice ? true : false)
                }
                
                Spacer()
            }
            
            let numberOfColumns = max(min(viewModel.dices.count, 2), 1)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: numberOfColumns), alignment: .center) {
                ForEach(viewModel.dices) { dice in
                    Text("\(dice.value)")
                        .font(.system(size: 90))
                        .fontDesign(.monospaced)
                        .foregroundStyle(.black)
                        .onTapGesture {
                            viewModel.deleteDice(id: dice.id)
                        }
                }
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
