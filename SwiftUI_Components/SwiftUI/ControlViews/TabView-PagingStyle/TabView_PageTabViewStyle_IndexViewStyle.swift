

import SwiftUI

private struct TabView_PageTabViewStyle_IndexViewStyle: View {
    var body: some View {
        TabView {
            VStack(spacing: 20) {
                HeaderView("TabView",
                           subtitle: "Index View Style",
                           desc: "You couldn't see the index dots on the bottom of the screen because it was white-on-white.")
                Text("PAGE 1")
                
                Spacer()
                
                DescView(desc: "To make the index dots show up better, use the indexViewStyle modifier.")
                
                Image(systemName: "arrow.down.circle")
                    .padding(.bottom, 45)
            }
            
            VStack {
                Text("PAGE 2")
            }
            VStack {
                Text("PAGE 3")
            }
        }
        .font(.title)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    TabView_PageTabViewStyle_IndexViewStyle()
}
