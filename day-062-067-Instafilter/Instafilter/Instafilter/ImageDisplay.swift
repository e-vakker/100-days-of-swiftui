//
//  ImageDisplay.swift
//  Instafilter
//
//  Created by Jevgeni Vakker on 18.08.2023.
//

import SwiftUI

struct ImageDisplay: View {
    @Binding var image: Image?
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.clear)
            
            Text("Tap to select a picture")
                .foregroundColor(.primary)
                .font(.headline)
            
            image?
                .resizable()
                .scaledToFit()
        }
    }
}

struct ImageDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ImageDisplay(image: .constant(nil))
    }
}
