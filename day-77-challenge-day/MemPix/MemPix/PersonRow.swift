//
//  PersonRow.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 01.09.2023.
//

import SwiftUI

struct PersonRow: View {
    let avatar: Image
    let firstName: String
    let lastName: String
    
    var body: some View {
        HStack(spacing: 20) {
            avatar
                .resizable()
                .scaledToFill()
                .frame(width: 75, height: 75)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .overlay {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .strokeBorder(.quaternary, lineWidth: 0.5)
                }
            Text("\(firstName) \(lastName)")
            Spacer()
        }
        .frame(height: 75)
    }
}

struct PersonRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonRow(avatar: Image("avatar"), firstName: "Pug", lastName: "Pugoff")
            .padding()
    }
}
