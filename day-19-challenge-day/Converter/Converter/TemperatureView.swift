//
//  TemperatureView.swift
//  Converter
//
//  Created by Jevgeni Vakker on 04.07.2023.
//

import SwiftUI

struct TemperatureView: View {
    
    private let title = "Temperature conversion"
    
    enum TemperatureScales: String, CaseIterable {
        case celsius = "Celsius"
        case fahrenheit = "Fahrenheit"
        case kelvin = "Kelvin"
    }
    
    @State private var temperatureScaleInput: TemperatureScales = .celsius
    @State private var temperatureScaleOutput: TemperatureScales = .fahrenheit
    
    @State private var temperatureUserInput: Double = 0
    
    private var temperatureOutput: Double {
        switch (temperatureScaleInput, temperatureScaleOutput) {
        case (.celsius, .fahrenheit):
            return (temperatureUserInput * 9/5) + 32
        case (.celsius, .kelvin):
            return temperatureUserInput + 273.15
        case (.fahrenheit, .celsius):
            return (temperatureUserInput - 32) * 5/9
        case (.fahrenheit, .kelvin):
            return (temperatureUserInput + 459.67) * 5/9
        case (.kelvin, .celsius):
            return temperatureUserInput - 273.15
        case (.kelvin, .fahrenheit):
            return (temperatureUserInput * 9/5) - 459.67
        default:
            return temperatureUserInput
        }
    }
    
    private var temperatureOutputString: String {
        switch (temperatureScaleOutput) {
        case .celsius:
            return temperatureOutput.formatted(.number) + " °C"
        case .fahrenheit:
            return temperatureOutput.formatted(.number) + " ℉"
        case .kelvin:
            return temperatureOutput.formatted(.number) + " K"
        }
    }
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack{
                Form {
                    Section("Enter temperature") {
                        HStack {
                            TextField("Enter temperature", value: $temperatureUserInput, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($isFocused)
                            Picker("", selection: $temperatureScaleInput) {
                                ForEach(TemperatureScales.allCases, id: \.self) { temperature in
                                    Text(temperature.rawValue)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                    }
                    Section("Result") {
                        HStack {
                            Text(temperatureOutputString)
                            Picker("", selection: $temperatureScaleOutput) {
                                ForEach(TemperatureScales.allCases, id: \.self) { temperature in
                                    Text(temperature.rawValue)
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

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
