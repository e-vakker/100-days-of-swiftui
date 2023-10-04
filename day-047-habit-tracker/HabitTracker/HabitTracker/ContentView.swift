//
//  ContentView.swift
//  HabitTracker
//
//  Created by Jevgeni Vakker on 25.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var manager = HabitManager()
    
    @State private var showingAddHabit: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($manager.habits) { $habit in
                    HabitListItemView(habit: $habit)
                        .contextMenu {
                            NavigationLink {
                                EditHabitView(habit: $habit)
                            } label: {
                                HStack {
                                    Text("Edit Habit")
                                    Spacer()
                                    Image(systemName: "info.circle")
                                }
                                
                            }
                        }
                }
                .onDelete(perform: deleteHabit)
            }
            .navigationTitle("Habit Tracker")
            .navigationBarTitleTextColor(.blue)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button() {
                            showingAddHabit = true
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("Add habit")
                            }
                            .font(.body)
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .foregroundColor(.blue)
                        }
                        Spacer()
                    }
                }
            }
            .toolbar {
                EditButton()
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habits: manager)
            }
        }
    }

    func deleteHabit(at offsets: IndexSet) {
        manager.habits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
