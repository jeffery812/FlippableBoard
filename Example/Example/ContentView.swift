//
// Copyright © 2022 Zhihui Tang. All rights reserved.
//

import SwiftUI
import FlippableBoard

struct ContentView: View {
    @State private var currentTime = Date.now.formattedString(format: "HH mm ss")
    @State private var randomLetter = "A"
    private let letters: String = "ABCDEFGHIGKLMNOPQRSTUVWXYZ1234567890"


    var body: some View {
        VStack {
            CardView(value: currentTime)
                .padding()
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        currentTime = Date.now.formattedString(format: "HH mm ss")
                        randomLetter = String(letters.randomElement() ?? "A")
                    }
                }
            FlippableBoardView(letters: currentTime)
                .frame(width: 300)

            CardView(value: randomLetter, textColor: .red)
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
