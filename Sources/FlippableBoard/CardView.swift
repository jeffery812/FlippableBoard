//
// Copyright © 2024 Zhihui Tang. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var value: String
    var configuration: Configuration
    var roundCorners: [Corner]

    var body: some View {
        Text(value)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .font(.system(size: configuration.fontSize).weight(.heavy).monospacedDigit())
            .foregroundStyle(configuration.textColor)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: configuration.cardAlignment)
            .padding(configuration.padding)
            .background {
                GeometryReader { proxy in
                    UnevenRoundedRectangle(
                        cornerRadii: RectangleCornerRadii(
                            topLeading: roundCorners.contains(.topLeading) ? configuration.roundRadius : 0,
                            bottomLeading: roundCorners.contains(.bottomLeading) ? configuration.roundRadius : 0,
                            bottomTrailing: roundCorners.contains(.bottomTrailing) ? configuration.roundRadius : 0,
                            topTrailing: roundCorners.contains(.topTrailing) ? configuration.roundRadius : 0),
                        style: .continuous)
                    .fill(LinearGradient(gradient: Gradient(colors: [configuration.backgroundColor, configuration.backgroundColor.opacity(0.8)]), startPoint: .bottom, endPoint: .top))
                }
            }
    }
}

#Preview {
    CardView(
        value: "12 23 34",
        configuration: Configuration(),
        roundCorners: [.topLeading, .bottomLeading, .topTrailing, .bottomTrailing]
    )
}
