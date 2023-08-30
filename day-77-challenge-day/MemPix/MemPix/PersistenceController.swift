//
//  PersistenceController.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 29.08.2023.
//

import Foundation
import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        self.container = NSPersistentContainer(name: "MemPix")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error as? NSError {
                fatalError("Error loading container \(error), \(error.userInfo)")
            }
        }
    }
    
    //MARK: - SwiftUI Preview helper
    
    static var preview: PersistenceController {
        let controller = PersistenceController(inMemory: true)
        let context = controller.container.viewContext
        
        for index in 0..<10 {
            let person = Contact(firstName: "First name", lastName: "Last name \(index)", context: context)
        }
        
        return controller
    }
}
