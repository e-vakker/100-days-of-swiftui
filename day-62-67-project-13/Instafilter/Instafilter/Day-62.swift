//
//  Day62View.swift
//  Instafilter
//
//  Created by Jevgeni Vakker on 14.08.2023.
//

import SwiftUI

struct Day62View: View {
    @State private var blurAmount: Double = 0.0
    
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        VStack {
            VStack {
                Text("Hello World")
                    .blur(radius: blurAmount)
                
                Slider(value: $blurAmount, in: 0...20)
                
                Button("Random Blur") {
                    blurAmount = Double.random(in: 0...20)
                }
                Button("Change background") {
                    showingConfirmation = true
                }
            }
            .onChange(of: blurAmount) { newValue in
                print("Blur Amount: \(blurAmount)")
            }
            .padding()
            .background(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(backgroundColor)
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Blue") { backgroundColor = .blue }
            Button("White") { backgroundColor = .white }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select a new color")
        }
    }
}

struct Day62View_Previews: PreviewProvider {
    static var previews: some View {
        Day62View()
    }
}
