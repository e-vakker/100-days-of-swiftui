//
//  ScenePhaseTest.swift
//  Flashzilla
//
//  Created by Jevgeni Vakker on 19.09.2023.
//

import SwiftUI

struct ScenePhaseTest: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("Hello, World!")
            .padding()
            .onChange(of: scenePhase) { newPhase in
                switch newPhase {
                case .background:
                    print("BackgroundPhase")
                case .inactive:
                    print("Inactive phase")
                case .active:
                    print("active phase")
                @unknown default:
                    fatalError()
                }
            }
    }
}

#Preview {
    ScenePhaseTest()
}
