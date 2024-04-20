// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct FlippableBoardView: View {
    private let letters: [String]

    public init(value: String) {
        self.letters = value.map { String($0) }
    }

    public var body: some View {
        Text("FlippableBoard")
    }
}
