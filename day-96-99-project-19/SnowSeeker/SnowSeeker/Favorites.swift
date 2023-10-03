//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Jevgeni Vakker on 03.10.2023.
//

import SwiftUI


class Favorites: ObservableObject {
    private var resorts: Set<String>
    private let saveKey = "Favorites"
    private let defaults = UserDefaults.standard
    
    init() {
        if let savedData = defaults.object(forKey: saveKey) as? Array<String> {
            resorts = Set(savedData)
            print("Success")
        } else {
            resorts = []
            print("Fail")
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        defaults.setValue(Array(resorts), forKey: saveKey)
    }
}
