//
//  HabitListItemView.swift
//  HabitTracker
//
//  Created by Jevgeni Vakker on 26.07.2023.
//

import SwiftUI

struct HabitListItemView: View {
    @Binding var habit: Habit
    
    var body: some View {
        HStack {
            Button {
                habit.habitComplete()
            } label: {
                Image(systemName: "plus")
                    .font(.title2)
            }
            .disabled(habit.timesCompletedToday == 20 ? true : false)
            VStack(alignment: .leading, spacing: 10) {
                Text("\(habit.name)")
                Text("\(habit.description)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            Spacer()
            Text("\(habit.timesCompletedToday)/\(habit.targetTimesPerDay)")
                .padding()
                .overlay() {
                    Circle()
                        .stroke(.red ,lineWidth: 1)
                }
        }
    }
}

struct HabitListItemView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            HabitListItemView(habit: .constant(Habit.sampleHabit()))
            HabitListItemView(habit: .constant(Habit.sampleHabit()))
            HabitListItemView(habit: .constant(Habit.sampleHabit()))
            HabitListItemView(habit: .constant(Habit.sampleHabit()))
        }
    }
}
