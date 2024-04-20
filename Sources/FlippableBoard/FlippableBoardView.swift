// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct FlippableBoardView: View {
    private let letters: [String]
    private let roundRadius: CGFloat

    public init(letters: String, roundRadius: CGFloat = 0) {
        self.letters = letters.map { String($0) }
        self.roundRadius = roundRadius
    }

    public var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<letters.count, id: \.self) { index in
                if letters[index].trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Spacer()
                        .frame(width: 2)
                } else {
                    FlippableCardView(value: letters[index], roundCorners: getRoundedCorners(index: index), roundRadius: 10)
                }
            }
        }
        .frame(height: 60)
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
