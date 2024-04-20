//
// Copyright © 2022 Zhihui Tang. All rights reserved.
//

import SwiftUI
import FlippableBoard

struct ContentView: View {
    @State private var currentTime = Date.now.formattedString(format: "HH mm ss")
    @State private var randomLetter = "A"
    private let letters: String = "ABCDEFGHIGKLMNOPQRSTUVWXYZ1234567890"
    private let configuration = Configuration()

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
            FlippableBoardView(letters: currentTime, configuration: configuration)
                .frame(width: 300)

            FlippableCardView(
                value: randomLetter,
                configuration: Configuration().withTextColor(.red),
                roundCorners: [.topLeading, .bottomLeading, .topTrailing, .bottomTrailing],
                roundRadius: 10
            )
                .frame(width: 100)
                .onTapGesture {
                    randomLetter = String(letters.randomElement() ?? "A")
                }
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

#Preview {
    ContentView()
}
