

import SwiftUI

private struct Scrollview_Horizontal_Circles: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0..<10) { index in
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 80, height: 80)
                    }
                }
            }
        }
    }
}

#Preview {
    Scrollview_Horizontal_Circles()
}
