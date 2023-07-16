//
//  GameView.swift
//  Edutainment
//
//  Created by Jevgeni Vakker on 13.07.2023.
//

import SwiftUI

struct GameView: View {
    
    @State var game: Game
    
    @State private var equals = ""
    
    @State private var animationOpacity = 0.0
    
    @FocusState private var isTextFieldFocused: Bool
    
    @Environment(\.presentationMode) var presentationMode
    
    var topBar: some View {
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
    }
    
    var bottomBar: some View {
        ZStack {
            VStack {
                Text("Your score: \(game.score)")
                    .titleIndigoStyle()
            }
            HStack {
                Spacer()
                Button(action: {
                    returnToMenu()
                }) {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.gray)
                        .font(.title)
                }
                .buttonStyle(.borderless)
                .padding(.leading)
            }
        }
        
        .padding()
        .frame(maxWidth: .infinity)
        .background(.regularMaterial)
        .opacity(game.isEndedGame ? 0.0 : 1.0)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    topBar
                    Spacer()
                    Text(game.finalScore > 0 ? "+\(game.finalScore)" : "\(game.finalScore)")
                        .font(.largeTitle)
                        .foregroundColor(game.finalScore > 0 ? .green : .red)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .opacity(animationOpacity)
                        .onChange(of: animationOpacity ) { _ in
                            withAnimation(.default.speed(0.50)) {
                                animationOpacity = 0.0
                            }
                        }
                    ZStack {
                        VStack(spacing: 40) {
                            Text("Your score: \(game.score)")
                            Button("Return to the menu") {
                                returnToMenu()
                            }
                            .buttonStyle(IndigoButton())
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
                        .opacity(game.isEndedGame ? 1.0 : 0.0)
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
                                .focused($isTextFieldFocused)
                            Button("Check") {
                                game.checkResult(result: equals)
                                equals = ""
                                animationOpacity = 1.0
                                isTextFieldFocused = false
                            }
                            .font(.title)
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
                        .opacity(game.isEndedGame ? 0.0 : 1.0)
                    }
                    Spacer()
                    bottomBar
                }
                .navigationBarBackButtonHidden(true)
            }
        }
        .onAppear() {
            game.makeGames()
        }
    }
    
    func returnToMenu() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let sample = Game(games: .five, difficulty: .easy, type: .addition, name: "Eva", avatar: Image("dog"))
        GameView(game: sample)
    }
}
