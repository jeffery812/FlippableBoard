//
// Copyright © 2024 Zhihui Tang. All rights reserved.
//

import SwiftUI
import FlippableBoard

struct ContentView: View {
    @State private var currentTime = Date.now.formattedString(format: "HH mm ss")
    @State private var randomLetter = "A"
    @State private var duration: CGFloat = 0.6
    private let letters: String = "ABCDEFGHIGKLMNOPQRSTUVWXYZ1234567890"
    private let configuration = Configuration().withAnimation(duration: 0.6).withFontSize(32)

    var body: some View {
        VStack {
            FlippableCardView(value: currentTime, configuration: configuration)
                .padding()
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        currentTime = Date.now.formattedString(format: "HH mm ss")
                        //randomLetter = String(letters.randomElement() ?? "A")
                    }
                }
                .frame(width: 200, height: 80)
            FlippableBoardView(letters: currentTime, configuration: configuration)
                .frame(width: 300, height: 80)

            FlippableCardView(
                value: randomLetter,
                configuration: Configuration()
                    .withTextColor(.red)
                    .withCenterLineColor(.green)
                    .withFontSize(96)
                    .withAnimation(duration: duration),
                roundCorners: [.topLeading, .bottomLeading, .topTrailing, .bottomTrailing]
            )
            .frame(width: 100, height: 80)
            .onTapGesture {
                randomLetter = String(letters.randomElement() ?? "A")
            }
            HStack {
                Text("0.0")
                Slider(value: $duration, in: 0.1...5, step: 0.1)
                Text("5.0")
            }
                .padding()
        }
    }
}


struct RoundedRect: View {
    var width: CGFloat = 160
    var height: CGFloat = 180
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .frame(width: width, height: height)
            .foregroundStyle(Color.gray)
    }
}
