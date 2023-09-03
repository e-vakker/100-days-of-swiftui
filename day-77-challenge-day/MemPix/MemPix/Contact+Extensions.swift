//
//  Contact+Extensions.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 30.08.2023.
//

import Foundation
import CoreData


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
                     context: NSManagedObjectContext) {
        self.init(context: context)
        self.firstName = firstName
        self.lastName = lastName
    }
    
    public override func awakeFromInsert() {
        self.uuid_ = UUID()
    }
    
    static func delete(contact: Contact) {
        guard let context = contact.managedObjectContext else { return }
        
        context.delete(contact)
    }
    
//    static func fetch(_ predicate: NSPredicate) -> NSFetchRequest<Contact> {
//        let request = Contact.fetchRequest()
//        request.sortDescriptors = [NSSortDescriptor(keyPath: \Contact.lastName_, ascending: true)]
//        request.predicate = predicate
//
//        return request
//    }
    
    //MARK: - Preview helper
    
    static var example: Contact {
        let context = PersistenceController.preview.container.viewContext
        let contact = Contact(firstName: "Pug", lastName: "Pugoff", context: context)
        return contact
    }
}

extension Contact: Comparable {
    public static func < (lhs: Contact, rhs: Contact) -> Bool {
        lhs.lastName < rhs.lastName
    }
}
