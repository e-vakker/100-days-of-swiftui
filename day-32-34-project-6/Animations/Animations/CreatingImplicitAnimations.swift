//
//  CreatingImplicitAnimations.swift
//  Animations
//
//  Created by Jevgeni Vakker on 12.07.2023.
//

import SwiftUI

struct CreatingImplicitAnimations: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
    }
}

struct CreatingImplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        CreatingImplicitAnimations()
    }
}
