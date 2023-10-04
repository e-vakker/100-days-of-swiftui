//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Jevgeni Vakker on 08.08.2023.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    
    public var wrappedFirstName: String {
        firstName ?? "Unknown first name"
    }
    
    public var wrappedLastName: String {
        lastName ?? "Unknown last name"
    }
}

extension Singer : Identifiable {

}
