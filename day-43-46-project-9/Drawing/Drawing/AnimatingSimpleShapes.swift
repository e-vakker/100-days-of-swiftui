//
//  AnimatingSimpleShapes.swift
//  Drawing
//
//  Created by Jevgeni Vakker on 22.07.2023.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct AnimatingSimpleShapes: View {
    
    @State private var insetAmount = 50.0
    
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation() {
                    insetAmount = Double.random(in: 10...90)
                }
                print(insetAmount)
            }
    }
}

struct AnimatingSimpleShapes_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingSimpleShapes()
    }
}
