//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jevgeni Vakker on 08.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    enum RPS: String, CaseIterable {
        case rock = "👊"
        case scissors = "✌️"
        case paper = "✋"
    }
    
    @State private var playerScore = 0
    @State private var botScore = 0
    @State private var gamesPassed = 0
    
    @State private var playerMove: RPS = .paper
    @State private var botMove: RPS = .paper
    
    @State private var messageTitle: String = ""
    
    @State private var showingAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.70)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("Game: \(gamesPassed)")
                    .font(.largeTitle.weight(.semibold))
                    .fontDesign(.rounded)
                HStack {
                    ForEach(RPS.allCases, id: \.self) { move in
                        Button() {
                            playGame(choice: move)
                        } label: {
                            Text(move.rawValue)
                                .font(.system(size: 60))
                                .padding()
                        }
                    }
                }
                Text(messageTitle)
                    .font(.headline.weight(.semibold))
                    .fontDesign(.rounded)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.regularMaterial)
            .cornerRadius(20)
            .padding()
            
            VStack {
                Text("Rock, paper, scissors!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack {
                    Text("Player Score: \(playerScore)")
                    Spacer()
                    Text("AI Score: \(botScore)")
                }
                .font(.headline)
                .padding()
                Spacer()
            }
            .foregroundColor(.white)
            .fontDesign(.rounded)
        }
        .onChange(of: gamesPassed) { value in
            if value == 10 {
                showingAlert = true
            }
        }
        .alert(Text("End game!"), isPresented: $showingAlert) {
            Button("Restart") {
                restartGame()
            }
        } message: {
            Text("Player Score: \(playerScore)\n AI Score: \(botScore)")
        }
    }
    
    func playGame(choice: RPS) {
        let botMove = RPS.allCases.randomElement()!
        
        switch (choice, botMove) {
        case (.rock, .rock), (.scissors, .scissors), (.paper, .paper):
            messageTitle = "It's a tie!"
        case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
            playerScore += 1
            messageTitle = "You win!"
        case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
            botScore += 1
            messageTitle = "You lose!"
        }
        gamesPassed += 1
    }
    
    func restartGame() {
        gamesPassed = 0
        playerScore = 0
        botScore = 0
        messageTitle = ""
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
