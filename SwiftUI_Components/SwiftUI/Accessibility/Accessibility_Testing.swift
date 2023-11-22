import SwiftUI

private struct Accessibility_Testing: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Accessibility",
                       subtitle: "Testing",
                       desc: "Use the Accessibility Inspector to test Voiceover.", back: .green)
            
            Text("Hello, new user!")
            Image(systemName: "hand.wave.fill")
                .font(Font.system(size: 50))
        }
        .font(.title)
    }
}

#Preview {
    Accessibility_Testing()
}
