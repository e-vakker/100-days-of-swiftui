//
//  PersistenceController.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 29.08.2023.
//

import Foundation
import CoreData

class PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()
    // Storage for Core Data
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
    
    func save() {
        let context = container.viewContext
        
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch {
            print("error saving context: \(error)")
        }
    }
    
    //MARK: - SwiftUI Preview helper
    
    static var preview: PersistenceController {
        let controller = PersistenceController(inMemory: true)
        
        // Create 10 examples
        for i in 0..<10 {
            let person = Contact(firstName: "First name \(i)", lastName: "Last name \(i)", context: controller.container.viewContext)
        }
        
        return controller
    }
}
