//
// Copyright © 2022 Kindred Group. All rights reserved.
//

import SwiftUI
import FlippableBoard

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            CardView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
