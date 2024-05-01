//
// Copyright © 2024 Zhihui Tang. All rights reserved.
//

import SwiftUI

public class Configuration {
    private(set) var textColor: Color
    private(set) var backgroundColor: Color
    private(set) var centerLineColor: Color
    private(set) var centerLineHeight: CGFloat
    private(set) var animationDuration: CGFloat
    private(set) var fontSize: CGFloat
    private(set) var roundRadius: CGFloat
    
    public init() {
        textColor = Color("textColor", bundle: .module)
        centerLineColor = Color("textColor", bundle: .module)
        backgroundColor = Color("backgroundColor", bundle: .module)
        animationDuration = 1
        roundRadius = 4
        fontSize = 64
        centerLineHeight = 2
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

    public func withCenterLineColor(_ color: Color) -> Configuration {
        centerLineColor = color
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

    public func withCenterLineHeight(_ height: CGFloat) -> Configuration {
        centerLineHeight = height
        return self
    }
}
