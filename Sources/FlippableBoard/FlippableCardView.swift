//
// Copyright © 2024 Zhihui Tang. All rights reserved.
//

import SwiftUI

public struct FlippableCardView: View {
    private let value: String
    private let roundRadius: CGFloat
    private let roundCorners: [Corner]
    private let rotationAngle: CGFloat
    private let configuration: Configuration
    
    @State var flipTop = false
    @State var flipBottom = false
    @State private var backDegree = 0.0
    @State private var frontDegree = 0.0
    
    @State private var currentText: String = ""
    @State private var newText: String = ""
    @State private var isFlipped = false
    @State private var transitionText = ""

    public init(value: String, configuration: Configuration, roundCorners: [Corner] = [], roundRadius: CGFloat = 0) {
        self.value = value
        self.configuration = configuration
        self.roundCorners = roundCorners
        self.roundRadius = roundRadius
        self.rotationAngle = Constants.rightAngle
    }

    public var body: some View {
        ZStack {
            topCard
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            bottomCard
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
        }
        .overlay {
            configuration.centerLineColor
                .frame(height: 2)
        }
        .onAppear {
            currentText = value
            transitionText = currentText

            newText = value
        }
        .onChange(of: value) { _, newValue in
            newText = newValue
            flipCard()
        }
    }
    
    private var topCard: some View {
        ZStack {
            GeometryReader { proxy in
                CardView(value: newText, configuration: configuration, roundCorners: roundCorners, roundRadius: roundRadius)
                    .mask {
                        Rectangle()
                            .frame(height: proxy.size.height)
                            .offset(y: -proxy.size.height / 2)
                    }
                CardView(value: currentText, configuration: configuration, roundCorners: roundCorners, roundRadius: roundRadius)
                    .mask {
                        Rectangle()
                            .frame(height: proxy.size.height)
                            .offset(y: -proxy.size.height / 2)
                    }
                    .rotation3DEffect(
                        Angle(degrees: frontDegree),
                        axis: (x: -0.5, y: 0.0, z: 0.0)
                    )
            }
        }
    }
    
    private var bottomCard: some View {
        ZStack {
            GeometryReader { proxy in
                CardView(value: transitionText, configuration: configuration, roundCorners: roundCorners, roundRadius: roundRadius)
                    .mask {
                        Rectangle()
                            .frame(height: proxy.size.height)
                            .offset(y: proxy.size.height / 2)
                    }
                CardView(value: newText, configuration: configuration, roundCorners: roundCorners, roundRadius: roundRadius)
                    .mask {
                        Rectangle()
                            .frame(height: proxy.size.height)
                            .offset(y: proxy.size.height / 2)
                    }
                    .rotation3DEffect(
                        Angle(degrees: backDegree),
                        axis: (x: -0.5, y: 0.0, z: 0.0)
                    )
            }
        }
    }
    
    private func flipCard() {
        isFlipped.toggle()
        let duration = configuration.animationDuration / 2
        withAnimation(nil) {
            frontDegree = 0
            backDegree = -Constants.rightAngle
        }
        
        withAnimation(.linear(duration: duration)) {
            frontDegree = Constants.rightAngle
        } completion: {
            frontDegree = 0
            currentText = newText
            withAnimation(.bouncy(duration: duration, extraBounce: 0.2)) {
                backDegree = 0
            } completion: {
                transitionText = newText
            }
        }
    }
    private func resetFlip() {
        // Directly apply animation nil to this specific state change
        DispatchQueue.main.async {
            withAnimation(nil) {
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

