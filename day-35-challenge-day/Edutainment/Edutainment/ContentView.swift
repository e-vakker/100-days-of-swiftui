//
//  ContentView.swift
//  Edutainment
//
//  Created by Jevgeni Vakker on 13.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var game: Game
    
    @State private var equals = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
//                Color.orange.opacity(0.10)
                VStack {
                    HStack {
                        Text("\(game.name)")
                            .titleIndigoStyle()
                        Spacer()
                        game.avatar
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                        
                    }
                    .frame(maxHeight: 50)
                    .padding()
                    .background(.regularMaterial)
                    Spacer()
                    VStack(spacing: 20) {
                        HStack {
                            Text("\(game.equations.first?.operand1 ?? 0)")
                            Text("\(game.type.operatorSymbol)")
                            Text("\(game.equations.first?.operand2 ?? 0)")
                            Text("=")
                        }
                        TextField("Equals", text: $equals)
                            .labelsHidden()
                            .font(.title2)
                            .padding()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .overlay {
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .strokeBorder(.quaternary, lineWidth: 0.5)
                            }
                            .autocorrectionDisabled(true)
                            .keyboardType(.decimalPad)
                        Button("Check Result") {
                            game.checkResult(result: equals)
                        }
                            .font(.title)
//                            .buttonStyle(IndigoButton())
                            .padding([.leading, .trailing], 60)
                    }
                    .font(.largeTitle)
                    .padding()
                    .titleIndigoStyle()
                    .background(.thickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .strokeBorder(.quaternary, lineWidth: 0.5)
                    }
                    .padding()
                    
                    Spacer()
                    VStack {
                        Text("Your score: \(game.score)")
                            .titleIndigoStyle()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                }
                //            .navigationBarBackButtonHidden(true)
            }
        }
        .onAppear() {
            game.makeGames()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let sample = Game(games: .five, difficulty: .easy, type: .addition, name: "Eva", avatar: Image("dog"))
        ContentView(game: sample)
    }
}
