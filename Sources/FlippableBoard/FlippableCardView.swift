//
// Copyright © 2022 Zhihui Tang. All rights reserved.
//

import SwiftUI

public struct FlippableCardView: View {
    private let value: String
    private let roundRadius: CGFloat
    private let roundCorners: [Corner]
    private let rotationAngle: CGFloat = 90.01
    private let configuration: Configuration
    
    @State var flipTop = false
    @State var flipBottom = false
    
    @State private var currentText: String = ""
    @State private var newText: String = ""

    public init(value: String, configuration: Configuration, roundCorners: [Corner] = [], roundRadius: CGFloat = 0) {
        self.value = value
        self.configuration = configuration
        self.roundCorners = roundCorners
        self.roundRadius = roundRadius
    }

    public var body: some View {
        VStack(spacing: 0) {
            topHalf
            bottomHalf
        }
        .overlay {
            Color.white
                .frame(height: 2)
        }
        .onAppear {
            currentText = value
            newText = value
        }
        .onChange(of: value) { _, newValue in
            newText = newValue
            flipCard()
        }
    }
    
    private var topHalf: some View {
        ZStack {
            CardHalfView(type: .top) {
                makeContent(value: newText)
            }
            CardHalfView(type: .top) {
                makeContent(value: currentText)
//                    .opacity(start ? 1 : 0)
//                    .transition(.identity) 
            }
            .rotation3DEffect(
                Angle(degrees: flipTop ? rotationAngle : 0.0),
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
//                    .opacity(end ? 1 : 0)
//                    .transition(.identity) 
            }
            .rotation3DEffect(
                Angle(degrees: flipBottom ? 0 : rotationAngle),
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
            .font(.system(size: 96).weight(.heavy).monospacedDigit())
            .foregroundStyle(configuration.textColor)
            .background {
                UnevenRoundedRectangle(
                    cornerRadii: RectangleCornerRadii(
                        topLeading: roundCorners.contains(.topLeading) ? roundRadius : 0,
                        bottomLeading: roundCorners.contains(.bottomLeading) ? roundRadius : 0,
                        bottomTrailing: roundCorners.contains(.bottomTrailing) ? roundRadius : 0,
                        topTrailing: roundCorners.contains(.topTrailing) ? roundRadius : 0),
                    style: .continuous)
                .fill(configuration.backgroundColor)
            }
    }
    
    private func flipCard() {
        // Top half
        withAnimation(.linear(duration: configuration.animationDuration / 2)) {
            // Flip top
            flipTop = true
        } completion: {
            withAnimation(.linear(duration: configuration.animationDuration / 2)) {
                // Flip bottom
                flipBottom = true
            } completion: {
                // All animation complete
                currentText = newText

                flipBottom = false
                flipTop = false
            }
        }
    }
}

#Preview {
    let configuration = Configuration()
    return FlippableCardView(value: "10:55:28", configuration: configuration)
}

