//
// Copyright © 2022 Zhihui Tang. All rights reserved.
//

import SwiftUI

public struct CardView: View {
    @State var start = false
    @State var end = false
    
    private let animationDuration: CGFloat
    private let value: String
    private let backgroundColor: Color
    private let textColor: Color
    
    @State private var currentText: String = ""
    @State private var newText: String = ""
    
    public init(value: String,textColor: Color? = nil, backgroundColor: Color? = nil, animationDuration: CGFloat? = nil) {
        self.value = value
        self.textColor = textColor ?? Configuration.textColor
        self.animationDuration = animationDuration ?? Configuration.animationDuration
        self.backgroundColor = backgroundColor ?? Configuration.backgroundColor
    }

    public var body: some View {
        VStack(spacing: 0) {
            topHalf
            bottomHalf
        }
        .onAppear {
            currentText = value
            newText = value
        }
        .onChange(of: value) { newValue in
            currentText = newText
            newText = newValue
            flipCard()
        }
        .overlay {
            Color.white
                .frame(height: 4)
        }
    }
    
    private var topHalf: some View {
        ZStack {
            CardHalfView(type: .top) {
                makeContent(value: newText)
            }
            CardHalfView(type: .top) {
                makeContent(value: currentText)
            }
            .rotation3DEffect(
                Angle(degrees: start ? 90 : 0),
                axis: (x: -1.0, y: 0.0, z: 0.0),
                anchor: .bottom,
                perspective: 0.5
            )
        }
    }
    
    private var bottomHalf: some View {
        ZStack {
            CardHalfView(type: .bottom) {
                makeContent(value: currentText)
            }
            CardHalfView(type: .bottom) {
                makeContent(value: newText)
            }
            .rotation3DEffect(
                Angle(degrees: end ? 0 : 90),
                axis: (x: 1.0, y: 0.0, z: 0.0),
                anchor: .top,
                perspective: 0.5
            )
        }
    }
    
    private func makeContent(value: String) -> some View {
        Text(value)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.system(size: 100).monospacedDigit())
            .foregroundStyle(textColor)
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(backgroundColor)
            }
    }
    
    private func flipCard() {
        // Top half
        let now: DispatchTime = .now()
        withAnimation(.linear(duration: animationDuration / 2)) {
            start.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: now + animationDuration) {
            start = false
            currentText = newText
        }
        
        // Bottom half
        DispatchQueue.main.asyncAfter(deadline: now + animationDuration / 2) {
            withAnimation(.linear(duration: animationDuration / 2)) {
                end = true
            }
        }

        DispatchQueue.main.asyncAfter(deadline: now + animationDuration) {
            end = false
        }
    }
}

#Preview {
    CardView(value: "10:55:28")
}

