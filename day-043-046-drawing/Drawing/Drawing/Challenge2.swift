//
//  Challenge2.swift
//  Drawing
//
//  Created by Jevgeni Vakker on 24.07.2023.
//

import SwiftUI


struct ColorCyclingRectangle: View {
    var amount = 0.0
    
    var body: some View {
        ZStack {
            ForEach(0..<100) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                    LinearGradient(gradient: Gradient(colors: [
                        color(for: value, brightness: 1),
                        color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom),
                    lineWidth: 1)
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(100) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct Challenge2: View {
    
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorCycle)
            
            Slider(value: $colorCycle)
        }
        .padding()
    }
}

struct Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        Challenge2()
    }
}
