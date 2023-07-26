//
//  Habit.swift
//  HabitTracker
//
//  Created by Jevgeni Vakker on 25.07.2023.
//

import Foundation

struct Habit: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    let startDate: Date
    var timesCompletedToday: Int = 0
    var targetTimesPerDay: Int
    
    // Returns an example of a habit for demonstration
    static func sampleHabit() -> Self {
        return Habit(
            name: "Morning Exercise",
            description: "Perform a 10-minute morning exercise routine",
            startDate: Date(),
            targetTimesPerDay: 1
        )
    }
}
