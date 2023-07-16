//
//  GameTypeSelectionView.swift
//  Edutainment
//
//  Created by Jevgeni Vakker on 13.07.2023.
//

import SwiftUI


struct GameTypeSelectionView: View {
    @State private var gameType: GameTypes = .addition
    @State private var selectedGameCount: TotalGames = .five
    @State private var selectedDifficulty: GameDifficulty = .medium
    @State private var selectedAvatar: Int = 22
    @State private var selectedName: String = ""
    
    @State private var showName = false
    
    @FocusState private var isNameFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                avatarSelection
                textFieldWithName
                gameSettings
                Spacer()
                if showName {
                    NavigationLink("Start Game", destination: GameView(game:
                                                                            Game(games: selectedGameCount,
                                                                                 difficulty: selectedDifficulty,
                                                                                 type: gameType,
                                                                                 name: selectedName,
                                                                                 avatar: avatar[selectedAvatar])))
                    .buttonStyle(IndigoButton())
                }
                
            }
            .padding()
        }
        .onChange(of: selectedName) { name in
            withAnimation(.linear) {
                if name.count >= 1 {
                    showName = true
                } else {
                    showName = false
                }
            }
        }
    }
    
    var avatarSelection: some View {
        VStack {
            Text("Your avatar")
                .font(.largeTitle)
                .titleIndigoStyle()
            HStack {
                Button(action: { changeAvatar(next: false) }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.indigo)
                            .imageScale(.large)
                    }
                }
                avatar[selectedAvatar]
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .padding([.trailing, .leading], 75)
                    .frame(height: 200)
                Button(action: { changeAvatar(next: true )}) {
                    HStack {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.indigo)
                            .imageScale(.large)
                    }
                }
            }
        }
    }
    
    var textFieldWithName: some View {
        VStack {
            if showName {
                Text("Your name is \(selectedName)")
                    .titleIndigoStyle()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .scale))
            }
            TextField("Your name", text: $selectedName)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .overlay {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .strokeBorder(.indigo, lineWidth: 1)
                }
                .autocorrectionDisabled(true)
                .focused($isNameFocused)
                .keyboardType(.namePhonePad)
        }
    }
    
    var gameSettings: some View {
        VStack {
            VStack {
                Text("\(gameType.displayTitle)")
                    .titleIndigoStyle()
                Picker("Select game type", selection: $gameType) {
                    ForEach(GameTypes.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            VStack {
                Text("\(selectedGameCount.displayText)")
                    .titleIndigoStyle()
                Picker("Select game count", selection: $selectedGameCount) {
                    ForEach(TotalGames.allCases, id: \.self) { gameCount in
                        Text("\(gameCount.rawValue)")
                    }
                }
                .pickerStyle(.segmented)
            }
            VStack {
                Text(selectedDifficulty.displayText)
                    .titleIndigoStyle()
                Picker("Select Difficulty", selection: $selectedDifficulty) {
                    ForEach(GameDifficulty.allCases, id: \.self) { difficult in
                        Text("\(difficult.rawValue)")
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
    
    func changeAvatar(next: Bool) {
        withAnimation(.linear) {
            selectedAvatar = next ? (selectedAvatar + 1) % avatar.count : (selectedAvatar - 1 + avatar.count) % avatar.count
        }
    }
}

struct GameTypeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GameTypeSelectionView()
    }
}
