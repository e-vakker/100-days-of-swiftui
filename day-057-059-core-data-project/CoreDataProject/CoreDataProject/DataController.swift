//
//  DataController.swift
//  CoreDataProject
//
//  Created by Jevgeni Vakker on 06.08.2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProjectApp")
    
    init() {
        container.loadPersistentStores() { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        
        self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
}
