//
//  MetalRenderingWithDrawingGroup.swift
//  Drawing
//
//  Created by Jevgeni Vakker on 22.07.2023.
//

import SwiftUI

struct ColorCycleCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct MetalRenderingWithDrawingGroup: View {
    
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCycleCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
    }
}

struct MetalRenderingWithDrawingGroup_Previews: PreviewProvider {
    static var previews: some View {
        MetalRenderingWithDrawingGroup()
    }
}
