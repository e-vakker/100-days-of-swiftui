//
//  HabitListItemView.swift
//  HabitTracker
//
//  Created by Jevgeni Vakker on 26.07.2023.
//

import SwiftUI

struct HabitListItemView: View {
    let habit: Habit
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HabitListItemView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListItemView(habit: Habit.sampleHabit())
    }
}
