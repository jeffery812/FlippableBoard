//
// Copyright © 2022 Kindred Group. All rights reserved.
//

import SwiftUI

struct Configuration {
    static var textColor: Color {
        Color("textColor", bundle: .module)
    }
    
    static var backgroundColor: Color {
        Color("backgroundColor", bundle: .module)
    }
}
