//
//  ContentView.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 29.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [SortDescriptor(\.lastName_)]) var persons: FetchedResults<Contact>
    
    @State var showingAddPersonSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(persons, id: \.id) { person in
                    NavigationLink {
                        PersonDetailView(person: person)
                    } label: {
                        PersonRow(person: person)
                    }
                }
                .onDelete(perform: removePersons)
            }
            .navigationTitle("MemPix")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            showingAddPersonSheet = true
                        } label: {
                            Image(systemName: "plus.circle.fill")
                            Text("Add new contact")
                                .font(.headline)
                        }
                        Spacer()
                    }
                    
                }
            }
            .sheet(isPresented: $showingAddPersonSheet) {
                AddPerson()
            }
            .toolbar {
                EditButton()
            }
            
        }

    }
    
    func removePersons(at offsets: IndexSet) {
        for index in offsets {
            let person = persons[index]
            let id = person.uuid
            // Generate a unique filename using UUID
            let uniqueFileName = id.uuidString + ".jpg"
            let filePath = FileManager.documentsDirectory.appendingPathComponent(uniqueFileName)
            context.delete(person)
            do {
                try FileManager.default.removeItem(at: filePath)
                print("The file has been deleted")
            } catch {
                print("The file has not been deleted")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
