//
// Copyright © 2022 Zhihui Tang. All rights reserved.
//

import SwiftUI
import FlippableBoard

struct ContentView: View {
    @State private var currentTime = Date.now.formattedString(format: "HH mm ss")

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            CardView(text: currentTime) 
        }
        .padding()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                currentTime = Date.now.formattedString(format: "HH mm ss")
            }
        }
    }
}

#Preview {
    ContentView()
}
