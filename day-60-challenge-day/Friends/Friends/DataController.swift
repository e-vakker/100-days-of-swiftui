//
//  DataController.swift
//  Friends
//
//  Created by Jevgeni Vakker on 11.08.2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        
        
    }
    
    func saveUsersToCoreData(users: [User], context: NSManagedObjectContext) {
        for user in users {
            let cashedUser = CachedUser(context: context)
            cashedUser.update(with: user, context: context)
        }
        
        do {
            if context.hasChanges {
                try context.save()
            }
        } catch {
            print("Error saving to Core Data: \(error)")
        }
    }
}
