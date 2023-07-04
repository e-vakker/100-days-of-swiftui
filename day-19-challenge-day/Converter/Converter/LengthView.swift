//
//  LengthView.swift
//  Converter
//
//  Created by Jevgeni Vakker on 04.07.2023.
//

import SwiftUI

struct LengthView: View {
    private let title = "Length conversion"
    
    enum LengthScales: String, CaseIterable {
        case meters = "Meters"
        case kilometers = "Kilometers"
        case feet = "Feet"
        case yards = "Yards"
        case miles = "Miles"
    }
    
    @State private var lengthScaleInput: LengthScales = .meters
    @State private var lengthScaleOutput: LengthScales = .feet
    
    @State private var lengthUserInput: Double = 0
    
    private var lengthOutput: Double {
        switch (lengthScaleInput, lengthScaleOutput) {
        case (.meters, .kilometers):
            return lengthUserInput / 1000
        case (.meters, .feet):
            return lengthUserInput * 3.28084
        case (.meters, .yards):
            return lengthUserInput * 1.09361
        case (.meters, .miles):
            return lengthUserInput * 0.000621371
        case (.kilometers, .meters):
            return lengthUserInput * 1000
        case (.kilometers, .feet):
            return lengthUserInput * 3280.84
        case (.kilometers, .yards):
            return lengthUserInput * 1093.61
        case (.kilometers, .miles):
            return lengthUserInput * 0.621371
        case (.feet, .meters):
            return lengthUserInput / 3.28084
        case (.feet, .kilometers):
            return lengthUserInput / 3280.84
        case (.feet, .yards):
            return lengthUserInput / 3
        case (.feet, .miles):
            return lengthUserInput / 5280
        case (.yards, .meters):
            return lengthUserInput / 1.09361
        case (.yards, .kilometers):
            return lengthUserInput / 1093.61
        case (.yards, .feet):
            return lengthUserInput * 3
        case (.yards, .miles):
            return lengthUserInput / 1760
        case (.miles, .meters):
            return lengthUserInput / 0.000621371
        case (.miles, .kilometers):
            return lengthUserInput / 0.621371
        case (.miles, .feet):
            return lengthUserInput * 5280
        case (.miles, .yards):
            return lengthUserInput * 1760
        default:
            return lengthUserInput
        }
    }
    
    private var lengthOutputString: String {
        switch lengthScaleOutput {
        case .meters:
            return lengthOutput.formatted(.number) + " m"
        case .kilometers:
            return lengthOutput.formatted(.number) + " km"
        case .feet:
            return lengthOutput.formatted(.number) + " ft"
        case .yards:
            return lengthOutput.formatted(.number) + " yd"
        case .miles:
            return lengthOutput.formatted(.number) + " mi"
        }
    }
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack{
                Form {
                    Section("Enter Length") {
                        HStack {
                            TextField("Enter Length", value: $lengthUserInput, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($isFocused)
                            Picker("", selection: $lengthScaleInput) {
                                ForEach(LengthScales.allCases, id: \.self) { length in
                                    Text(length.rawValue)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                    }
                    Section("Result") {
                        HStack {
                            Text(lengthOutputString)
                            Picker("", selection: $lengthScaleOutput) {
                                ForEach(LengthScales.allCases, id: \.self) { length in
                                    Text(length.rawValue)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                    }
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}
