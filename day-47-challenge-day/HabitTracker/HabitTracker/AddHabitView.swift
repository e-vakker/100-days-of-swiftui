//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Jevgeni Vakker on 26.07.2023.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habits: HabitManager
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    @State private var targetTimesPerDay = 1
    
    @FocusState private var nameFieldIsFocused
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Habit Details")) {
                    TextField("Title", text: $name)
                        .focused($nameFieldIsFocused)
                    TextField("Notes", text: $description, axis: .vertical)
                }
                
                Section(header: Text("Target Times Per Day")) {
                    Stepper(value: $targetTimesPerDay, in: 1...20) {
                        Text("\(targetTimesPerDay)")
                    }
                }
            }
            .navigationTitle("Add Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addHabit()
                    } label: {
                        Text("Add")
                            .fontWeight(.medium)
                    }
                    .disabled(name.isEmpty ? true : false)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        .onAppear {
            nameFieldIsFocused = true
        }
    }
    
    func addHabit() {
        guard !name.isEmpty else {
            return
        }
        let newHabit = Habit(name: name, description: description, startDate: Date(), targetTimesPerDay: targetTimesPerDay)
        habits.addHabit(newHabit)
        dismiss()
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: HabitManager())
    }
}
