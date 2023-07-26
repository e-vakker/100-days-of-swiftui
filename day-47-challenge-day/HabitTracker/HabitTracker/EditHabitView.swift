//
//  EditHabitView.swift
//  HabitTracker
//
//  Created by Jevgeni Vakker on 26.07.2023.
//

import SwiftUI

struct EditHabitView: View {
    @Binding var habit: Habit
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var targetTimesPerDay: Int = 1
    @State private var timesCompletedToday: Int = 0
    
    @FocusState private var nameFieldIsFocused
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Habit Details") {
                    TextField("Title", text: $name)
                        .focused($nameFieldIsFocused)
                    TextField("Notes", text: $description, axis: .vertical)
                        .lineLimit(7)
                        .frame(minHeight: 70, alignment: .top)
                }
                Section("Target Times Per Day") {
                    Stepper(value: $targetTimesPerDay, in: 1...20) {
                        Text("\(targetTimesPerDay)")
                    }
                }
                Section("Completed Times") {
                    Stepper(value: $timesCompletedToday, in: 0...20) {
                        Text("\(timesCompletedToday)")
                    }
                }
            }
            .navigationTitle("Edit \(habit.name)")
            .navigationBarTitleTextColor(.blue)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        editHabit()
                        dismiss()
                    } label: {
                        Text("Done")
                            .fontWeight(.medium)
                    }
                }
            }
        }
        .onAppear {
            name = habit.name
            description = habit.description
            targetTimesPerDay = habit.targetTimesPerDay
            timesCompletedToday = habit.timesCompletedToday
        }
    }
    
    func editHabit() {
        habit.name = name
        habit.description = description
        habit.targetTimesPerDay = targetTimesPerDay
        habit.timesCompletedToday = timesCompletedToday
    }
}

struct EditHabitView_Previews: PreviewProvider {
    static var previews: some View {
        EditHabitView(habit: .constant(Habit.sampleHabit()))
    }
}
