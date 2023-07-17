//
//  ContentView.swift
//  iExpense
//
//  Created by Jevgeni Vakker on 17.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                if expenses.items.contains(where: {$0.type == "Personal"}) {
                    Section("Personal") {
                        generateSection(for: "Personal")
                    }
                }
                if expenses.items.contains(where: {$0.type == "Business"}) {
                    Section("Business") {
                        generateSection(for: "Business")
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                   showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func generateSection(for type: String) -> some View {
        ForEach(expenses.items, id: \.id) { item in
            if item.type == type {
                HStack {
                    Text(item.name)
                        .font(.headline)
                    Spacer()
                    Text(item.amount, format: .currency(code: item.currency)).tag(item.currency)
                        .foregroundColor(currencyColorStyle(amountExpenses: item.amount))
                }
            }
        }
        .onDelete(perform: removeItems)
    }
    
    func currencyColorStyle(amountExpenses: Double) -> Color {
        switch amountExpenses {
        case 0...10:
            return .green
        case 11...99:
            return .blue
        case 100...:
            return .red
        default:
            return .white
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
