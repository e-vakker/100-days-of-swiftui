//
//  ContentView.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 28.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    @State private var visibleTotal: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Roll Dice")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .fontDesign(.monospaced)
                    
                    Text("Total: \(visibleTotal)")
                        .font(.title)
                        .foregroundStyle(.black)
                        .fontWeight(.heavy)
                        .fontDesign(.monospaced)
                        .padding(25)
                        .background(.thickMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                        .contextMenu(menuItems: {
                            Button(action: { viewModel.removeHistory() }) {
                                Label("Remove history", systemImage: "trash")
                            }
                        })
                    
                    Spacer()
                }
                
                let numberOfColumns = max(min(viewModel.dices.count, 2), 1)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: numberOfColumns), alignment: .center) {
                    ForEach(viewModel.dices) { dice in
                        DiceView(value: dice.value)
                            .onTapGesture {
                                viewModel.deleteDice(id: dice.id)
                                Haptic.feedback()
                            }
                            .transition(.asymmetric(insertion: .move(edge: .top), removal: .opacity))
                    }
                    .animation(.spring(), value: viewModel.dices)
                }
                
                VStack {
                    Spacer()
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
                    Button(action: {
                        viewModel.rollAllDices()
                        Haptic.feedback()
                    }) {
                        Text("Roll")
                            .font(.title)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding([.top, .bottom], 10)
                            .background(viewModel.dices.isEmpty ? .gray : .black)
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        
                    }
                    .buttonStyle(BlackGrayButtonStyle())
                    .disabled(viewModel.dices.isEmpty ? true : false)
                }
                
            }
            .padding()
            .background {
                HistoryView(rollDicesHistory: viewModel.rollDicesHistory)
            }
            .onChange(of: viewModel.total) {
                Task {
                    await animateValueChange()
                }
        }
        }
    }
    
    private func animateValueChange() async {
        
        let increment: Int
        if viewModel.total > visibleTotal {
            increment = 1
        } else if viewModel.total < visibleTotal {
            increment = -1
        } else {
            return
        }
        
        for newValue in stride(from: visibleTotal, through: viewModel.total, by: increment) {
            visibleTotal = newValue
            do {
                try await Task.sleep(nanoseconds: 10_000_000)
            } catch {
                visibleTotal = viewModel.total
            }
           
        }
    }
}

#Preview("Main View") {
    ContentView()
}
