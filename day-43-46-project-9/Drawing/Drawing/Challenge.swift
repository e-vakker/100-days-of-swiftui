//
//  Challenge.swift
//  Drawing
//
//  Created by Jevgeni Vakker on 24.07.2023.
//

import SwiftUI

struct Arrow: View {
    var lineWidth: Double
    var height: Double
    
    var animatableData: Double {
        get { lineWidth }
        set { lineWidth = newValue }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Triangle()
                .frame(width: lineWidth * 2.5, height: height / 2)
            Rectangle()
                .frame(width: lineWidth, height: height)
        }
    }
}

struct Challenge: View {
    
    @State private var lineWidth = 10.0
    
    var body: some View {
        Arrow(lineWidth: lineWidth, height: 100)
            .onTapGesture {
                withAnimation() {
                    lineWidth = Double.random(in: 5...200)
                }
            }
    }
}

struct Challenge_Previews: PreviewProvider {
    static var previews: some View {
        Challenge()
    }
}
