//
//  PersonRow.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 01.09.2023.
//

import SwiftUI

struct PersonRow: View {
    let person: Contact
    
    var body: some View {
        HStack(spacing: 20) {
            if let image = person.image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .strokeBorder(.quaternary, lineWidth: 0.5)
                    }
            } else {
                Color.gray
            }
            Text("\(person.firstName) \(person.lastName)")
            Spacer()
        }
        .frame(height: 75)
    }
}

struct PersonRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonRow(person: Contact.example)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
