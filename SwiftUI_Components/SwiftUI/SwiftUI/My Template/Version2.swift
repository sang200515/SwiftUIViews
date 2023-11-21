

import SwiftUI

private struct Version2: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Title",
                       subtitle: "Subtitle",
                       desc: "Short description of what I am demonstrating goes here.",
                       back: .purple, textColor: .white)
        }
        .font(.title)
    }
}

struct Version2_Previews: PreviewProvider {
    static var previews: some View {
        Version2()
    }
}
