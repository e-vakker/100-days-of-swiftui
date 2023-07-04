//
//  VolumeView.swift
//  Converter
//
//  Created by Jevgeni Vakker on 04.07.2023.
//

import SwiftUI

struct VolumeView: View {
    private let title = "Volume conversion"
    
    enum VolumeUnit: String, CaseIterable {
        case milliliters = "Milliliters"
        case liters = "Liters"
        case cups = "Cups"
        case pints = "Pints"
        case gallons = "Gallons"
    }
    
    @State private var volumeUnitInput: VolumeUnit = .milliliters
    @State private var volumeUnitOutput: VolumeUnit = .liters
    
    @State private var volumeUserInput: Double = 0
    
    private var volumeOutput: Double {
        switch (volumeUnitInput, volumeUnitOutput) {
        case (.milliliters, .liters):
            return volumeUserInput / 1000
        case (.milliliters, .cups):
            return volumeUserInput / 237
        case (.milliliters, .pints):
            return volumeUserInput / 473
        case (.milliliters, .gallons):
            return volumeUserInput / 3785
        case (.liters, .milliliters):
            return volumeUserInput * 1000
        case (.liters, .cups):
            return volumeUserInput * 4.227
        case (.liters, .pints):
            return volumeUserInput * 2.113
        case (.liters, .gallons):
            return volumeUserInput / 3.785
        case (.cups, .milliliters):
            return volumeUserInput * 237
        case (.cups, .liters):
            return volumeUserInput / 4.227
        case (.cups, .pints):
            return volumeUserInput / 2
        case (.cups, .gallons):
            return volumeUserInput / 15.773
        case (.pints, .milliliters):
            return volumeUserInput * 473
        case (.pints, .liters):
            return volumeUserInput / 2.113
        case (.pints, .cups):
            return volumeUserInput * 2
        case (.pints, .gallons):
            return volumeUserInput / 8
        case (.gallons, .milliliters):
            return volumeUserInput * 3785
        case (.gallons, .liters):
            return volumeUserInput * 3.785
        case (.gallons, .cups):
            return volumeUserInput * 15.773
        case (.gallons, .pints):
            return volumeUserInput * 8
        default:
            return volumeUserInput
        }
    }
    
    private var volumeOutputString: String {
        switch volumeUnitOutput {
        case .milliliters:
            return "\(volumeOutput.formatted(.number.precision(.fractionLength(2)))) mL"
        case .liters:
            return "\(volumeOutput.formatted(.number.precision(.fractionLength(2)))) L"
        case .cups:
            return "\(volumeOutput.formatted(.number.precision(.fractionLength(2)))) cups"
        case .pints:
            return "\(volumeOutput.formatted(.number.precision(.fractionLength(2)))) pints"
        case .gallons:
            return "\(volumeOutput.formatted(.number.precision(.fractionLength(2)))) gallons"
        }
    }
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter volume") {
                    HStack {
                        TextField("Enter volume", value: $volumeUserInput, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                        Picker("", selection: $volumeUnitInput) {
                            ForEach(VolumeUnit.allCases, id: \.self) { unit in
                                Text(unit.rawValue)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
                Section("Result") {
                    HStack {
                        Text(volumeOutputString)
                        Picker("", selection: $volumeUnitOutput) {
                            ForEach(VolumeUnit.allCases, id: \.self) { unit in
                                Text(unit.rawValue)
                            }
                        }
                        .pickerStyle(.menu)
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

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView()
    }
}

