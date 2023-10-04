//
//  ContentView.swift
//  BetterRest
//
//  Created by Jevgeni Vakker on 09.07.2023.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    static var defaultWakeUp: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var wakeUp = defaultWakeUp
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var idealBedtimeMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    VStack(alignment: .leading) {
                        Section("When do you want to wake up?") {
                            DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                        }
                    }
                    VStack(alignment: .leading) {
                        Section("Desired amount to sleep") {
                            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                        }
                    }
                    VStack(alignment: .leading) {
                        Section {
                            Picker("Daily coffee intake", selection: $coffeeAmount) {
                                ForEach(1...20, id: \.self) { amount in
                                    Text(amount == 1 ? "1 cup" : "\(amount) cups")
                                }
                            }
                        }
                    }
                }
                VStack {
                    Text(idealBedtimeMessage)
                        .font(.largeTitle)
                        .foregroundColor(.blue.opacity(0.70))
                        .multilineTextAlignment(.center)
                }
            }
            .navigationTitle("Better Rest")
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
            .onAppear() {
                calculateBedTime()
            }
            .onChange(of: [sleepAmount, Double(coffeeAmount)]) { _ in
                calculateBedTime()
            }
            .onChange(of: wakeUp) { _ in
                calculateBedTime()
            }

        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let sleepTimeFormatted = sleepTime.formatted(date: .omitted, time: .shortened)
            idealBedtimeMessage = "Your ideal bedtime is " + sleepTimeFormatted
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            showingAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
