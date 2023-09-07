//
//  ContentView2.swift
//  HotProspects
//
//  Created by Jevgeni Vakker on 07.09.2023.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    @Published var value = 0
    
    init() {
        for i in 0...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ContentView2: View {
    @StateObject var updater = DelayedUpdater()
    
    @State private var output = ""
    
    var body: some View {
        VStack {
            Text("Value is \(updater.value)")
            Text(output)
                .task {
                    await fetchReadings()
                }
        }
    }
    
    func fetchReadings() async {
//        do {
//            let url = URL(string: "https://hws.dev/readings.json")!
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let readings = try JSONDecoder().decode([Double].self, from: data)
//            output = "Found \(readings.count) readings"
//        } catch {
//            print("Download Error")
//        }
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Error: \(error.localizedDescription)"
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
