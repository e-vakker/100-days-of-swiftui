//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jevgeni Vakker on 06.07.2023.
//

import SwiftUI


struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    @State private var useRedText = false
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var spells: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    var spells2: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    @ViewBuilder var spells3: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    struct CapsuleText: View {
        var text: String
        
        var body: some View {
            Text(text)
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Button("Hello World") {
                    useRedText.toggle()
                }
                .foregroundColor(useRedText ? .red : .blue)
                VStack {
                    Text("Gryffindor")
                        .font(.largeTitle)
                    Text("Hufflepuff")
                    Text("Ravenclaw")
                    Text("Slytherin")
                }
                .font(.title)
                VStack {
                    Text("Gryffindor")
                        .blur(radius: 0)
                    Text("Hufflepuff")
                    Text("Ravenclaw")
                    Text("Slytherin")
                }
                .blur(radius: 5)
                VStack {
                    motto1
                        .foregroundColor(.red)
                    motto2
                        .foregroundColor(.blue)
                }
                spells
                spells2
                spells3
                VStack(spacing: 10) {
                    CapsuleText(text: "First")
                    CapsuleText(text: "Second")
                }
                VStack {
                    Text("Hello World")
                        .titleStyle()
                    Color.blue
                        .frame(width: 300, height: 200)
                        .watermarked(with: "Hacking with Swift")
                }
            }
            .frame(maxWidth: .infinity)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
