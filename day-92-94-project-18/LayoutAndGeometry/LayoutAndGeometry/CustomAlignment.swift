//
//  CustomAlignment.swift
//  LayoutAndGeometry
//
//  Created by Jevgeni Vakker on 26.09.2023.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignment: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@e-vakker")
                    .alignmentGuide(.midAccountAndName, computeValue: { dimension in
                        dimension[VerticalAlignment.center]
                    })
                Rectangle()
                    .frame(width: 64, height: 64)
                    .overlay(
                        Image("Earth")
                            .resizable()
                            .scaledToFit()
                    )
            }
            
            VStack {
                Text("Full name:")
                Text("JEVGENI VAKKER")
                    .alignmentGuide(.midAccountAndName, computeValue: { dimension in
                        dimension[VerticalAlignment.center]
                    })
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    CustomAlignment()
}
