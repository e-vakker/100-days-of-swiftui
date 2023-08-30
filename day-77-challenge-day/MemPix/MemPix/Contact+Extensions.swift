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
        #if DEBUG
        uuid_!
        #else
        uuid_ = UUID()
        #endif
    }
    
    var firstName: String {
        get { firstName_ ?? "" }
        set { firstName_ = newValue }
    }
    
    var lastName: String {
        get { lastName_ ?? "" }
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
    
}
