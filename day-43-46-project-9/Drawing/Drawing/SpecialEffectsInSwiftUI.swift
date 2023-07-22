//
//  SpecialEffectsInSwiftUI.swift
//  Drawing
//
//  Created by Jevgeni Vakker on 22.07.2023.
//

import SwiftUI

struct BlendMode: View {
    var body: some View {
        ZStack {
            Image("Example")
                .resizable()
                .scaledToFit()
            
            Rectangle()
                .fill(.red)
                .blendMode(.multiply)
        }
        .frame(width: 400, height: 500)
        .clipped()
    }
}

struct ColorMultiply: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            Image("Example")
                .resizable()
                .scaledToFit()
                .colorMultiply(.blue)
            Image("Example")
                .resizable()
                .scaledToFit()
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
    }
}

struct BlendModeScreen: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct SpecialEffectsInSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        BlendMode()
        ColorMultiply()
        BlendModeScreen()
    }
}
