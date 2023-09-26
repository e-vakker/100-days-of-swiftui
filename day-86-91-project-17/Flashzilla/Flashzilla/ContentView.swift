//
//  ContentView.swift
//  Flashzilla
//
//  Created by Jevgeni Vakker on 21.09.2023.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}

struct ContentView: View {
   
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    @Environment(\.scenePhase) var scenePhase
    
    @State private var cards = [Card]()
    @State private var TimerIsActive = true
    @State private var timeRemaining = 100
    @State private var showingEditScreen = false
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        showingEditScreen = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
            
            if differentiateWithoutColor || voiceOverEnabled {
                VStack {
                    Spacer()
                    
                    HStack {
                        Button {
                            withAnimation {
                                if let last = cards.last {
                                    restockCard(last)
                                }
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect")
                       
                        Spacer()
                        
                        Button {
                            withAnimation {
                                if let last = cards.last {
                                    removeCard(last)
                                }
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct.")
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
            
            VStack {
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                
                ZStack {
                    ForEach(cards) { card in
                        CardView(card: card) { isCorrect in
                            if isCorrect {
                                withAnimation {
                                    removeCard(card)
                                }
                            } else {
                                withAnimation {
                                    restockCard(card)
                                }
                            }
                            
                        }
                        .stacked(at: cards.firstIndex(where: {$0.id == card.id}) ?? 0, in: cards.count)
                        .allowsHitTesting(card.id == cards.last?.id)
                        .accessibilityHidden(cards.firstIndex(where: {$0.id == card.id}) ?? 0 < cards.count - 1)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(.white)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                }
            }
        }
        
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                if cards.isEmpty == false {
                    TimerIsActive = true
                }
            } else {
                TimerIsActive = false
            }
        }
        .onReceive(timer, perform: { timer in
            guard TimerIsActive else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        })
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: {
            EditCards()
        })
        .onAppear(perform: {
            resetCards()
        })
    }
    
    func removeCard(_ card: Card) {
        cards.removeAll(where: { $0.id == card.id })
        if cards.isEmpty {
            TimerIsActive = false
        }
    }
    
    func restockCard(_ card: Card) {
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            let cardToRestock = cards.remove(at: index)
            cards.insert(cardToRestock, at: cards.startIndex)
        }
    }
    
    func resetCards() {
        timeRemaining = 100
        TimerIsActive = true
        loadData()
    }
    
    func loadData() {
        do {
            let data = try Data(contentsOf: FileManager.documentDirectory)
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        } catch {
            cards = []
        }
        
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
}

@available(iOS 17, *)
#Preview(traits: .landscapeRight) {
    ContentView()
}
