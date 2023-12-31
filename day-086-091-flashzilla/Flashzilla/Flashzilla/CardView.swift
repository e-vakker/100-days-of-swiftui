//
//  CardView.swift
//  Flashzilla
//
//  Created by Jevgeni Vakker on 21.09.2023.
//

import SwiftUI

struct CardBackground: ViewModifier {
    var offset: CGSize
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    var fillColor: Color {
        if offset.width > 1 {
            return Color.green
        } else if offset.width < -1 {
            return Color.red
        } else {
            return Color.white
        }
    }
    
    func body(content: Content) -> some View {
        content
            .background {
                differentiateWithoutColor
                ? nil
                : RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                    .fill(fillColor)
            }
    }
}

extension View {
    func customCardBackground(offset: CGSize) -> some View {
        self.modifier(CardBackground(offset: offset))
    }
}

struct CardView: View {
    let card: Card
    
    var removal: ((Bool) -> Void)? = nil
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    
    @State private var isShowingAnswer = false
    
    @State private var offset = CGSize.zero
    
    @State private var feedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutColor ? .white : .white.opacity(1 - Double(abs(offset.width / 50)))
                )
                .customCardBackground(offset: offset)
                .shadow(radius: 10)
            
            VStack {
                if voiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    feedback.prepare()
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        if offset.width > 0 {
                            feedback.notificationOccurred(.success)
                            removal?(true)
                        } else {
                            feedback.notificationOccurred(.error)
                            removal?(false)
                            offset = .zero
                        }
                        
                       
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.spring(), value: offset)
    }
}

@available(iOS 17, *)
#Preview(traits: .landscapeRight) {
    CardView(card: Card.example)
}
