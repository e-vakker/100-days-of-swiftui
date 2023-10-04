//
//  ContentView.swift
//  Converter
//
//  Created by Jevgeni Vakker on 04.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TemperatureView()
                .tabItem {
                    Label("Temperature", systemImage: "thermometer.low")
                }
            LengthView()
                .tabItem {
                    Label("Length", systemImage: "line.horizontal.3.decrease")
                }
            TimeView()
                .tabItem {
                    Label("Time", systemImage: "clock.arrow.2.circlepath")
                }
            VolumeView()
                .tabItem {
                    Label("Volume", systemImage: "drop")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
