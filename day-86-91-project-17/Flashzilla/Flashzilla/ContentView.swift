//
//  ContentView.swift
//  Flashzilla
//
//  Created by Jevgeni Vakker on 19.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .scaleEffect(finalAmount - currentAmount)
                .gesture(MagnificationGesture()
                    .onChanged { amount in
                        currentAmount = amount - 1
                    }
                    .onEnded { amount in
                        finalAmount += currentAmount
                        currentAmount = 0
                    })
        }
        .padding()
    }
}

struct ContentView2: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    
    var body: some View {
        VStack {
            Text("Hello, world 2")
                .rotationEffect(currentAmount + finalAmount)
                .gesture(RotationGesture()
                    .onChanged { angle in
                        currentAmount = angle
                    }
                    .onEnded { angle in
                        finalAmount += currentAmount
                        currentAmount = .zero
                    })
        }
        .padding()
    }
}

struct ContentView3: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1.0)
            .offset(offset)
            .gesture(combined)
    }
}

struct ContentShapeTest: View {
    
    var body: some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview("First") {
    ContentShapeTest()
}

#Preview("Second") {
    ContentView()
}

#Preview("Third") {
    ContentView2()
}

#Preview("Forth") {
    ContentView3()
}
