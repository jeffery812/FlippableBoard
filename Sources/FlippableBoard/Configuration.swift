//
// Copyright © 2024 Zhihui Tang. All rights reserved.
//

import SwiftUI

public class Configuration {
    private(set) var textColor: Color
    private(set) var backgroundColor: Color
    private(set) var animationDuration: CGFloat
    private(set) var fontSize: CGFloat
    private(set) var roundRadius: CGFloat
    private(set) var padding: EdgeInsets
    private(set) var cardAlignment: Alignment
    
    public init() {
        textColor = Color("textColor", bundle: .module)
        backgroundColor = Color("backgroundColor", bundle: .module)
        animationDuration = 1
        roundRadius = 4
        fontSize = 64
        padding = EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2)
        cardAlignment = .center
    }
    
    public func withTextColor(_ color: Color) -> Configuration {
        textColor = color
        return self
    }
    
    public func withBackgroundColor(_ color: Color) -> Configuration {
        backgroundColor = color
        return self
    }
    public func withAnimation(duration: CGFloat) -> Configuration {
        animationDuration = duration
        return self
    }

    public func withFontSize(_ size: CGFloat) -> Configuration {
        fontSize = size
        return self
    }

    public func withRoundRadius(_ radius: CGFloat) -> Configuration {
        roundRadius = radius
        return self
    }

    public func withPadding(_ edgeInsets: EdgeInsets) -> Configuration {
        padding = edgeInsets
        return self
    }

    public func withCardAlignment(_ alignment: Alignment) -> Configuration {
        cardAlignment = alignment
        return self
    }
}
