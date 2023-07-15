//
//  Styles.swift
//  Edutainment
//
//  Created by Jevgeni Vakker on 15.07.2023.
//

import Foundation
import SwiftUI

struct IndigoButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(15)
            .font(.title2)
            .fontDesign(.rounded)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [.indigo, .indigo.opacity(0.60)], startPoint: .leading, endPoint: .trailing))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .strokeBorder(.quaternary, lineWidth: 0.5)
            }
            .opacity(configuration.isPressed ? 0.80 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct TitleIndigo: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.medium)
            .foregroundColor(.indigo)
            .fontDesign(.rounded)
    }
}

extension View {
    func titleIndigoStyle() -> some View {
        modifier(TitleIndigo())
    }
}
