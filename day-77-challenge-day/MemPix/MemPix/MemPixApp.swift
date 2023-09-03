//
//  MemPixApp.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 29.08.2023.
//

import SwiftUI

@main
struct MemPixApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
