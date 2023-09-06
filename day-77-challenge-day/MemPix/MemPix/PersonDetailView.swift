//
//  PersonDetailView.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 01.09.2023.
//

import SwiftUI
import MapKit

struct PersonDetailView: View {
    let person: Contact
    
    let locationFetcher = LocationFetcher()
    
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))

    var body: some View {
        ScrollView {
            ZStack {
                VStack(spacing: 20) {
                    ZStack {
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
                    .RoundedViewStyle()
                    Map(coordinateRegion: $mapRegion)
                        .aspectRatio(3.0 / 1.0, contentMode: .fit)
                        .RoundedViewStyle()
                }
                .padding()
                .onAppear {
                    locationFetcher.start()
                }
            }
        }
        .background(Color.secondary.opacity(0.15))
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: Contact.example)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

    }
}
