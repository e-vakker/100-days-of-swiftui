//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Jevgeni Vakker on 08.08.2023.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    enum Predicate: String {
        case beginsWith = "BEGINSWITH"
    }
    
    init(filterKey: String, filterValue: String, predicate: Predicate, sortDescriptors: [NSSortDescriptor], @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
}
