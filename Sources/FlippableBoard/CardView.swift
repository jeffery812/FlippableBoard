//
// Copyright © 2022 Zhihui Tang. All rights reserved.
//

import SwiftUI

public struct CardView: View {
    @State private var isFlipped = false
    @State private var backDegree = 0.0
    @State private var frontDegree = -90.0
    @State private var degree = -90.0
    
    let durationAndDelay: CGFloat = 0.5
    let text: String
    
    public init(text: String) {
        self.text = text
    }
    public var body: some View {
        VStack(spacing: 0) {
            CardHalfView(type: .top) {
                content
            }
            CardHalfView(type: .bottom) {
                content
            }
        }
        .onChange(of: text) { _ in
            print("text changed: \(text)")
        }
        .overlay {
            Color.white
                .frame(height: 4)
        }
    }
    
    private var content: some View {
        Text(text)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.system(size: 100).monospacedDigit())
            .foregroundStyle(Color.white)
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
            }
    }
    
    private func flipCard() {
        isFlipped.toggle()
        
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                backDegree = 0
            }
        }
    }
}

struct CardFront: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
            Image(systemName: "suit.club.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(Color.red)
        }
        .rotation3DEffect(
            Angle(degrees: degree),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}
struct CardBack: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue.opacity(0.2))
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            Text("Back")
                .foregroundStyle(Color.white)
        }
        .rotation3DEffect(
            Angle(degrees: degree),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}

#Preview {
    CardView(text: "10:55:28")
}
