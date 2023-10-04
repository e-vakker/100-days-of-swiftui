//
//  SingerView.swift
//  CoreDataProject
//
//  Created by Jevgeni Vakker on 08.08.2023.
//

import SwiftUI

struct SingerView: View {
    @Environment(\.managedObjectContext) var moc

    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter, predicate: .beginsWith, sortDescriptors: [NSSortDescriptor(key: "lastName", ascending: true)]) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

struct SingerView_Previews: PreviewProvider {
    static var dataController = DataController()
    
    static var previews: some View {
        SingerView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}
