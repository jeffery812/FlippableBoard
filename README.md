# FlippableCardView & FlippableBoardView

Welcome to the repository for the FlippableCardView and FlippableBoardView, SwiftUI components designed to mimic the flipping motion of an old-style flip clock. These views provide an engaging and visually appealing way to display changing data, such as time, numerical counters, or any cyclic data in a fun, retro style.

## Features

- **FlippableCardView**: A single card component that flips vertically, perfect for displaying individual digits or elements. Customize the appearance with round corners, background and text colors, and more.
- **FlippableBoardView**: A board of multiple flippable cards that work in unison to represent more complex data like a full clock display or a counter.
- **Smooth Animations**: Enjoy the smooth, realistic flip animations that bring the retro flip clock experience to your modern SwiftUI applications.
- **Highly Customizable**: Both views are designed to be easily customizable to fit the style of your app. Modify sizes, colors, corner roundness, and more to suit your needs.
- **SwiftUI Compatibility**: Built entirely with SwiftUI, ensuring seamless integration into your SwiftUI projects and compatibility with iOS, macOS, and watchOS.

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/zhihuitang/FlippableBoard
   ```

2. **Explore the Example App:** Check out the included example app to see how you can integrate the FlippableCardView and FlippableBoardView into your own projects.
3. **Integrate into Your Project:** Include the views in your project and start customizing.

## Example Usage
Here's a quick example to get you started with a simple clock view:
```swift
import SwiftUI

struct ContentView: View {
    @State private var currentTime = Date()
    private let configuration = Configuration().withAnimation(duration: 0.6)


    var body: some View {
        FlippableBoardView(letters: currentTime, configuration: configuration)
                .frame(width: 300, height: 80)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    currentTime = Date.now.formattedString(format: "HH mm ss")
                }
            }
    }
}


extension Date {
    func formattedString(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

```