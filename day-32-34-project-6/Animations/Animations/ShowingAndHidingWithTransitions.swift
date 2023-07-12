//
//  ShowingAndHidingWithTransitions.swift
//  Animations
//
//  Created by Jevgeni Vakker on 12.07.2023.
//

import SwiftUI

struct ShowingAndHidingWithTransitions: View {
    
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation() {
                    isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .opacity, removal: .slide))
            }
        }
    }
}

struct ShowingAndHidingWithTransitions_Previews: PreviewProvider {
    static var previews: some View {
        ShowingAndHidingWithTransitions()
    }
}
