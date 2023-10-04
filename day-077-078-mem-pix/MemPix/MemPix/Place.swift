//
//  Place.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 05.09.2023.
//

import Foundation
import CoreLocation

struct Place: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}
