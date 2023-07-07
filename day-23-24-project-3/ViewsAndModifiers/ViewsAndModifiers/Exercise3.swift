//
//  Exercise3.swift
//  ViewsAndModifiers
//
//  Created by Jevgeni Vakker on 07.07.2023.
//

import SwiftUI

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeTitleStyle() -> some View {
        modifier(LargeTitle())
    }
}

struct Exercise3: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .largeTitleStyle()
    }
}

struct Exercise3_Previews: PreviewProvider {
    static var previews: some View {
        Exercise3()
    }
}
