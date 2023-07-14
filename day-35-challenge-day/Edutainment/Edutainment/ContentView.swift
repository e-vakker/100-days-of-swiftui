//
//  ContentView.swift
//  Edutainment
//
//  Created by Jevgeni Vakker on 13.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    var game: Game
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("Text")
                }
            }
            .navigationTitle("Edutainment")
//            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: Game(games: .twenty, difficulty: .medium, type: .addition, name: "Eva", avatar: Image("dog")))
    }
}
