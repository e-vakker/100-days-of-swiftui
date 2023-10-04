//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Jevgeni Vakker on 06.08.2023.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
