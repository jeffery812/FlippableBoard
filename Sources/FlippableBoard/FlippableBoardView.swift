// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct FlippableBoardView<Content>: View where Content: View {
    private let letters: [String]
    private let configuration: Configuration
    private let centerLine: Content

    public init(letters: String, configuration: Configuration, centerLine: () -> Content = { EmptyView() }) {
        self.letters = letters.map { String($0) }
        self.configuration = configuration
        self.centerLine = centerLine()
    }

    public var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<letters.count, id: \.self) { index in
                FlippableCardView(value: letters[index], configuration: configuration, roundCorners: getRoundedCorners(index: index)) {
                    centerLine
                }
            }
        }
    }

    private func getRoundedCorners(index: Int) -> [Corner] {
        if index == 0 {
            return [.topLeading, .bottomLeading]
        } else if index == letters.count - 1 {
            return [.topTrailing, .bottomTrailing]
        } else {
            return []
        }
    }
}
