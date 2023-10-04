//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jevgeni Vakker on 05.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var showingRestartGame = false
    @State private var scoreTitle = ""
    @State private var alertMessage = ""
    @State private var userScore = 0
    @State private var gameCount = 0
    
    @State private var animationAmount = 0.0
    @State private var opacity = 1.0
    @State private var countryTapped = 0
    @State private var scale = 1.0
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            VStack {
                Spacer()
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
                            countryTapped = number
                            flagTapped(number)
                            withAnimation() {
                                animationAmount += 360
                            }
                            withAnimation(.easeOut(duration: 0.50)) {
                                opacity = 0.25
                            }
                            withAnimation(.linear(duration: 0.50)) {
                                scale = 0.0
                            }
                        } label: {
                            FlagImage(country: countries[number])
                                .rotation3DEffect(
                                    countryTapped == number ? .degrees(animationAmount) : .degrees(0),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .opacity(countryTapped != number ? opacity : 1.0)
                                .scaleEffect(countryTapped != number ? scale : 1.0)
                                .accessibilityLabel(labels[countries[number]] ?? "Unknown flag")
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Text("Score: \(userScore == 0 ? "???" : String(userScore))")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                Spacer()
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
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        opacity = 1
        scale = 1
    }
    
    func askQuestion() {
        opacity = 1
        scale = 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
