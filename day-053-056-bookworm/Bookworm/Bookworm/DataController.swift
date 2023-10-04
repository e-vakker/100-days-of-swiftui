//
//  DataController.swift
//  Bookworm
//
//  Created by Jevgeni Vakker on 01.08.2023.
//

import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    func createSampleData() {
        let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
        
        let bookTitles = [
            "The Hobbit",
            "Dracula",
            "Harry Potter and the Sorcerer's Stone",
            "Sherlock Holmes: A Study in Scarlet",
            "Leaves of Grass",
            "Pride and Prejudice",
            "Gone Girl"
        ]
        
        let bookAuthors = [
            "J.R.R. Tolkien",
            "Bram Stoker",
            "J.K. Rowling",
            "Arthur Conan Doyle",
            "Walt Whitman",
            "Jane Austen",
            "Gillian Flynn"
        ]
        
        let reviews = [
            "A classic fantasy adventure that takes you on a journey through Middle-earth.",
            "A chilling tale of the infamous vampire Count Dracula.",
            "The start of an epic wizarding saga filled with magic and friendship.",
            "The brilliant detective Sherlock Holmes solves his first mysterious case.",
            "A collection of poems celebrating the beauty of nature and the human spirit.",
            "A delightful romance novel with memorable characters.",
            "A gripping thriller that keeps you on the edge of your seat."
        ]
        
        for i in 0..<7 {
            let newBook = Book(context: self.container.viewContext)
            newBook.id = UUID()
            newBook.title = bookTitles[i]
            newBook.author = bookAuthors[i]
            newBook.rating = Int16(Int.random(in: 1...5)) // Rating will be between 1 and 5 random
            newBook.genre = genres[i]
            newBook.review = reviews[i]
            newBook.date = Date.now
        }
        
        try? self.container.viewContext.save()
    }
    
    init() {
        container.loadPersistentStores() { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
