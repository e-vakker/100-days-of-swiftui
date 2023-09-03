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
                        let imageURL = FileManager.documentsDirectory.appendingPathComponent("\(person.uuid).jpg")
                        if let image = UIImage(contentsOfFile: imageURL.path()) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
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
    }
}
