//
//  HabitManager.swift
//  HabitTracker
//
//  Created by Jevgeni Vakker on 26.07.2023.
//

import Foundation

class HabitManager: ObservableObject {
    @Published var habits: [Habit] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        habits = loadedHabits()
    }
    
    func loadedHabits() -> [Habit] {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                return decodedItems
            }
        }
        
        return []
    }
    
    func addHabit(_ habit: Habit) {
        habits.append(habit)
    }
}
