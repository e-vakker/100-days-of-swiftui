//
//  Contact+Extensions.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 30.08.2023.
//

import Foundation
import CoreData
import SwiftUI
import CoreLocation


extension Contact {
    var uuid: UUID {
        if let uuid = uuid_ {
            return uuid
        } else {
            let newUUID = UUID()
            uuid_ = newUUID
            return newUUID
        }
    }
    
    var firstName: String {
        get { firstName_ ?? "Error" }
        set { firstName_ = newValue }
    }
    
    var lastName: String {
        get { lastName_ ?? "Error" }
        set { lastName_ = newValue }
    }
    
    convenience init(firstName: String,
                     lastName: String,
                     longitude: Double,
                     latitude: Double,
                     context: NSManagedObjectContext) {
        self.init(context: context)
        self.firstName = firstName
        self.lastName = lastName
        self.longitude = longitude
        self.latitude = latitude
    }
    
    public override func awakeFromInsert() {
        self.uuid_ = UUID()
    }
    
    static func delete(contact: Contact) {
        guard let context = contact.managedObjectContext else { return }
        
        context.delete(contact)
    }
    
    //MARK: - Preview helper
    
    static let example: Contact = {
        let context = PersistenceController.preview.container.viewContext
        let contact = Contact(firstName: "Pug", lastName: "Pugoff", longitude: 0, latitude: 0, context: context)
        return contact
    }()
}

extension Contact: Comparable {
    public static func < (lhs: Contact, rhs: Contact) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

extension Contact {
    var image: Image? {
        let fileName = "\(uuid).jpg"
        let path = FileManager.documentsDirectory.appendingPathComponent(fileName).path()
        if let image = UIImage(contentsOfFile: path) {
            return Image(uiImage: image)
        }
        return nil
    }
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
