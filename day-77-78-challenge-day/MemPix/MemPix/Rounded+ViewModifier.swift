//
//  Rounded+ViewModifier.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 05.09.2023.
//

import Foundation
import SwiftUI

struct RoundedView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .strokeBorder(.quaternary, lineWidth: 0.5)
            }
    }
}

extension View {
    func RoundedViewStyle() -> some View {
        modifier(RoundedView())
    }
}
