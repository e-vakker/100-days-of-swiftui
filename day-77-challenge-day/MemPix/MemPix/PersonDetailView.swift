//
//  PersonDetailView.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 01.09.2023.
//

import SwiftUI

struct PersonDetailView: View {
    let person: Contact

    var body: some View {
        ZStack {
            ZStack {
                Color.black
                    .frame(maxWidth: .infinity)
                
                Color.clear
                    .aspectRatio(1, contentMode: .fit)
                    .overlay {
                        if let image = person.image {
                            image
                                .resizable()
                                .scaledToFill()
                        } else {
                            Color.gray
                        }
                    }
                    .clipped()
                    .overlay() {
                        VStack {
                            Spacer()
                            HStack {
                                Text("\(person.firstName) \(person.lastName)")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .padding()
                                Spacer()
                            }
                        }
                    }
            }
        }
        .ignoresSafeArea()
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: Contact.example)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

    }
}
