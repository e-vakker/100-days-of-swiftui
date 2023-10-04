//
//  HabitListItemView.swift
//  HabitTracker
//
//  Created by Jevgeni Vakker on 26.07.2023.
//

import SwiftUI

struct HabitListItemView: View {
    @Binding var habit: Habit
    
    @State private var colorGoal: Color = .red
    
    var body: some View {
        HStack(spacing: 20) {
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
                .background(colorGoal)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .strokeBorder(.quaternary, lineWidth: 1)
                }
                .frame(width: 70)
                .foregroundColor(.white)
        }
        .onChange(of: habit.timesCompletedToday) { completedToday in
            withAnimation() {
                if completedToday >= habit.targetTimesPerDay {
                    colorGoal = .green
                } else if completedToday >= 1 {
                    colorGoal = .yellow
                } else if completedToday == 0 {
                    colorGoal = .red
                }
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
