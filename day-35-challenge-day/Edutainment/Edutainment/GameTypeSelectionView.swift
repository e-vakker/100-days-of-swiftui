//
//  GameTypeSelectionView.swift
//  Edutainment
//
//  Created by Jevgeni Vakker on 13.07.2023.
//

import SwiftUI


struct IndigoButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(15)
            .frame(maxWidth: .infinity)
            .background(.indigo)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.80 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct TitleIndigo: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.medium)
            .foregroundColor(.indigo)
    }
}

extension View {
    func titleIndigoStyle() -> some View {
        modifier(TitleIndigo())
    }
}

struct GameTypeSelectionView: View {
    
    enum GameTypes: String, CaseIterable {
        case multiplication = "✖️"
        case division = "➗"
        case addition = "➕"
        case subtraction = "➖"
        
        var displayTitle: String {
            var title: String = ""
            switch self {
            case .addition:
                title = "Addition"
            case .multiplication:
                title = "Multiplication"
            case .division:
                title = "Division"
            case .subtraction:
                title = "Subtraction"
            }
            return "\(title) mode"
        }
    }
    
    enum TotalGames: Int, CaseIterable {
        case five = 5
        case ten = 10
        case twenty = 20
        
        var displayText: String {
            "\(self.rawValue) games"
        }
    }
    
    enum GameDifficulty: String, CaseIterable {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
        
        var displayText: String {
            "\(self.rawValue) difficulty"
        }
    }
    
    @State private var gameType: GameTypes = .addition
    @State private var selectedGameCount: TotalGames = .five
    @State private var selectedDifficulty: GameDifficulty = .medium
    
    
    var body: some View {
        NavigationStack() {
            VStack(spacing: 20) {
                Text("Select game type")
                    .font(.largeTitle)
                    .titleIndigoStyle()
                Text("\(gameType.displayTitle)")
                    .titleIndigoStyle()
                Picker("Select game type", selection: $gameType) {
                    ForEach(GameTypes.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                Text("\(selectedGameCount.displayText)")
                    .titleIndigoStyle()
                Picker("Select game count", selection: $selectedGameCount) {
                    ForEach(TotalGames.allCases, id: \.self) { gameCount in
                        Text("\(gameCount.rawValue)")
                    }
                }
                .pickerStyle(.segmented)
                Text(selectedDifficulty.displayText)
                    .titleIndigoStyle()
                Picker("Select Difficulty", selection: $selectedDifficulty) {
                    ForEach(GameDifficulty.allCases, id: \.self) { difficult in
                        Text("\(difficult.rawValue)")
                    }
                }
                .pickerStyle(.segmented)
                Spacer()
                Button("Start Game") { }
                    .buttonStyle(IndigoButton())
            }
            .padding()
        }
    }
}

struct GameTypeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GameTypeSelectionView()
    }
}
