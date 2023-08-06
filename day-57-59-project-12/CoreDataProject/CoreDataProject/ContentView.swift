//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Jevgeni Vakker on 06.08.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            if moc.hasChanges {
                try? moc.save()
            }
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
