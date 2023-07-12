//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Jevgeni Vakker on 07.07.2023.
//

import SwiftUI

struct FlagImage: View {
    let country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(country: "Estonia")
    }
}
