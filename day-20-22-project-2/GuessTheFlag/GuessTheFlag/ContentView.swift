//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jevgeni Vakker on 05.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var showingRestartGame = false
    @State private var scoreTitle = ""
    @State private var alertMessage = ""
    @State private var userScore = 0
    @State private var gameCount = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ],
                           center: .top,
                           startRadius: 200,
                           endRadius: 400)
            .ignoresSafeArea()
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundColor(.secondary)
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(alertMessage)
                .foregroundColor(.white)
                .font(.title.bold())
        }
        .alert("End game", isPresented: $showingRestartGame) {
            Button("Restart Game", action: restartGame)
        } message: {
            Text(alertMessage)
                .foregroundColor(.white)
                .font(.title.bold())
        }
    }
    
    func flagTapped(_ number: Int) {
        if gameCount == 8 {
            showingRestartGame = true
            return
        }
        gameCount += 1
        if number == correctAnswer {
            userScore += 1
            scoreTitle = "Correct"
            alertMessage = "Your score is \(userScore)"
        } else {
            scoreTitle = "Wrong"
            alertMessage = "That’s the flag of \(countries[number])"
        }
        
        showingScore = true
    }
    
    func restartGame() {
        userScore = 0
        gameCount = 0
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
