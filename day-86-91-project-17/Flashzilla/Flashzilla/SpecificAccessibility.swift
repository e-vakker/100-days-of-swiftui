//
//  SpecificAccessibility.swift
//  Flashzilla
//
//  Created by Jevgeni Vakker on 20.09.2023.
//

import SwiftUI

struct DifferentiateWithoutColor: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
}

struct ReduceMotion: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    
    var body: some View {
        Text("Hello, World!")
            .scaleEffect(scale)
            .onTapGesture {
                if reduceMotion {
                    scale *= 1.5
                } else {
                    withAnimation {
                        scale *= 1.5
                    }
                }
            }
    }
}

#Preview("Differentiate Without Color") {
    DifferentiateWithoutColor()
}

#Preview("Reduce Motion") {
    ReduceMotion()
}


