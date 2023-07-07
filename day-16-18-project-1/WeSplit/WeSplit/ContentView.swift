//
//  ContentView.swift
//  WeSplit
//
//  Created by Jevgeni Vakker on 02.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool

    var body: some View {
        NavigationStack {
            Form {
                Section("Amount") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: localCurrency))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much tip do you want to leave?") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0...100, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: localCurrency))
                }
                Section("Total") {
                    Text(grandTotal, format: .currency(code: localCurrency))
                        .foregroundColor(tipPercentage == 0 ? Color.red : Color.primary)
                }
            }
            .navigationTitle("We Split")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
