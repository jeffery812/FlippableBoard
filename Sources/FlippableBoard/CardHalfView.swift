//
// Copyright © 2022 Kindred Group. All rights reserved.
//

import SwiftUI

struct CardHalfView<Content: View>: View {
    let content: Content

    let type: Type
    enum `Type` {
        case top
        case bottom
    }

    init(type: Type = .top, @ViewBuilder content: () -> Content) {
        self.type = type
        self.content = content()
    }

    var body: some View {
        GeometryReader { proxy in
            content
                .frame(width: proxy.size.width, height: proxy.size.height)
                .offset(y: calculateOffset(height: proxy.size.height))
                .clipped()
        }
    }
    
    private func calculateOffset(height: CGFloat) -> CGFloat {
        switch type {
        case .top:
            height / 2
        case .bottom:
            -height / 2
        }
        
    }
    
    private var rotationAnchor: UnitPoint {
        switch type {
        case .top:
            .bottom
        case .bottom:
            .top
        }
    }
}

#Preview {
    CardHalfView() {
        Text("Hello")
    }
}
