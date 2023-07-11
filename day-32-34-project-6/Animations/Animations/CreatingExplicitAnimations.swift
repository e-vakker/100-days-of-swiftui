//
//  CreatingExplicitAnimations.swift
//  Animations
//
//  Created by Jevgeni Vakker on 12.07.2023.
//

import SwiftUI

struct CreatingExplicitAnimations: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct CreatingExplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        CreatingExplicitAnimations()
    }
}
