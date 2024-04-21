//
// Copyright © 2024 Zhihui Tang. All rights reserved.
//

import Foundation

extension Date {
    func formattedString(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
