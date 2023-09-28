//
//  ContentView.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 28.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Roll Dice")
                    .font(.largeTitle)
                    .foregroundStyle(.cyan)
                    .fontDesign(.monospaced)
                
                Spacer()
            }
           
            Text("55")
                .font(.system(size: 100, design: .monospaced))
                .foregroundStyle(.cyan)
            
            VStack {
                Spacer()
                Button(action: { }) {
                    Text("Roll")
                        .font(.title)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .background(.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    
                }
            }
        }
        .padding()
    }
}

#Preview("Main View") {
    ContentView()
}
