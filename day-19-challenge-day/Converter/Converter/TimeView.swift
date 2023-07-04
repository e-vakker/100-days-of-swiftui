//
//  TimeView.swift
//  Converter
//
//  Created by Jevgeni Vakker on 04.07.2023.
//

import SwiftUI

struct TimeView: View {
    private let title = "Time conversion"
    
    enum TimeInterval: String, CaseIterable {
        case seconds = "Seconds"
        case minutes = "Minutes"
        case hours = "Hours"
        case days = "Days"
    }
    
    @State private var timeScaleInput: TimeInterval = .minutes
    @State private var timeScaleOutput: TimeInterval = .hours
    
    @State private var timeUserInput: Double = 0
    
    private var timeOutput: Double {
        switch (timeScaleInput, timeScaleOutput) {
        case (.seconds, .minutes):
            return timeUserInput / 60
        case (.seconds, .hours):
            return timeUserInput / 3600
        case (.seconds, .days):
            return timeUserInput / 86400
        case (.minutes, .seconds):
            return timeUserInput * 60
        case (.minutes, .hours):
            return timeUserInput / 60
        case (.minutes, .days):
            return timeUserInput / 1440
        case (.hours, .seconds):
            return timeUserInput * 3600
        case (.hours, .minutes):
            return timeUserInput * 60
        case (.hours, .days):
            return timeUserInput / 24
        case (.days, .seconds):
            return timeUserInput * 86400
        case (.days, .minutes):
            return timeUserInput * 1440
        case (.days, .hours):
            return timeUserInput * 24
        default:
            return timeUserInput
        }
    }
    
    private var timeOutputString: String {
        switch timeScaleOutput {
        case .seconds:
            return "\(timeOutput.formatted(.number.precision(.fractionLength(2)))) s"
        case .minutes:
            return "\(timeOutput.formatted(.number.precision(.fractionLength(2)))) min"
        case .hours:
            return "\(timeOutput.formatted(.number.precision(.fractionLength(2)))) hr"
        case .days:
            return "\(timeOutput.formatted(.number.precision(.fractionLength(2)))) days"
        }
    }
    
    @FocusState private var isFocused: Bool

    var body: some View {
        NavigationStack {
            Form {
                Section("Enter time interval") {
                    HStack {
                        TextField("Enter time interval", value: $timeUserInput, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                        Picker("", selection: $timeScaleInput) {
                            ForEach(TimeInterval.allCases, id: \.self) { interval in
                                Text(interval.rawValue)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
                Section("Result") {
                    HStack {
                        Text(timeOutputString)
                        Picker("", selection: $timeScaleOutput) {
                            ForEach(TimeInterval.allCases, id: \.self) { interval in
                                Text(interval.rawValue)
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

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
