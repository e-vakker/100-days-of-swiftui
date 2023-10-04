//
//  FaceIdDemo.swift
//  BucketList
//
//  Created by Jevgeni Vakker on 21.08.2023.
//

import SwiftUI
import LocalAuthentication

struct FaceIdDemo: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    isUnlocked = true
                } else {
                    isUnlocked = false
                }
            }
        }
        else {
            isUnlocked = false
        }
    }
}

struct FaceIdDemo_Previews: PreviewProvider {
    static var previews: some View {
        FaceIdDemo()
    }
}
