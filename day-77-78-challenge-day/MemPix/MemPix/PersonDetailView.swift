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
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    @State private var places:[Place] = []

    var body: some View {
        ScrollView {
            ZStack {
                VStack(spacing: 20) {
                    ZStack {
                        Color.clear
                            .aspectRatio(1.0, contentMode: .fit)
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
                    Map(coordinateRegion: $mapRegion, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: places) {
                        place in
                        MapMarker(coordinate: place.location, tint: .purple)
                    }
                    .aspectRatio(2.0 / 1.0, contentMode: .fit)
                    .RoundedViewStyle()
                }
                .padding()
            }
        }
        .background(Color.secondary.opacity(0.15))
        .onAppear {
            let place = Place(lat: person.latitude, long: person.longitude)
            let initialRegion = MKCoordinateRegion(center: place.location, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            mapRegion = initialRegion
            places.isEmpty ? places.append(place) : (places[0] = place)
        }
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: Contact.example)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

    }
}
