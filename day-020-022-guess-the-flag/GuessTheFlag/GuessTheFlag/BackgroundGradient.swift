//
//  BackgroundGradient.swift
//  GuessTheFlag
//
//  Created by Jevgeni Vakker on 13.07.2023.
//

import SwiftUI

struct BackgroundGradient: View {
    var body: some View {
        RadialGradient(stops: [
            .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
            .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
        ],
                       center: .top,
                       startRadius: 200,
                       endRadius: 400)
        .ignoresSafeArea()
    }
}

struct BackgroundGradient_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradient()
    }
}
