//
//  ContentView.swift
//  Moonshot
//
//  Created by Jevgeni Vakker on 18.07.2023.
//

import SwiftUI

struct ContentView: View {
//    Used generic
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var isGrid = true

    var body: some View {
        NavigationView {
            VStack {
                if isGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                        .transition(.opacity)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                        .transition(.opacity)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(isGrid ? "List" : "Grid") {
                        isGrid.toggle()
                    }
                }
            }
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .background(.darkBackground)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
