//
// Copyright © 2022 Kindred Group. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var value: String
    var configuration: Configuration
    var roundCorners: [Corner]
    var roundRadius: CGFloat

    var body: some View {
        Text(value)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
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
                .fill(LinearGradient(gradient: Gradient(colors: [configuration.backgroundColor, configuration.backgroundColor.opacity(0.8)]), startPoint: .bottom, endPoint: .top))
            }
        
    }
}

#Preview {
    CardView(
        value: "12 23 34",
        configuration: Configuration(),
        roundCorners: [.topLeading, .bottomLeading, .topTrailing, .bottomTrailing],
        roundRadius: 10
    )
}
