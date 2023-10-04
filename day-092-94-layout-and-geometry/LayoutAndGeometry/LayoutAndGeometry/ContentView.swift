//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Jevgeni Vakker on 26.09.2023.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        let minY = geo.frame(in: .global).minY
                        let fullViewHalf = fullView.size.height / 2
                        
                        let normalizedValueOpacity = min(max((minY - fullViewHalf) / (fullViewHalf) + 0.8, 0), 1)
                        let normalizedValueScale = min(max((minY - fullViewHalf) / (fullViewHalf) + 0.9, 0.50), 1.20)
                        
                        let hue = Double(index) / Double(50)
                        let color = Color(hue: hue, saturation: 1.0, brightness: 1.0)
                        
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(color)
                            .rotation3DEffect(.degrees(minY - fullViewHalf) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(normalizedValueOpacity)
                            .scaleEffect(normalizedValueScale)
                            .onAppear {
                                print(normalizedValueScale)
                            }
                    }
                    .frame(height: 40)
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
