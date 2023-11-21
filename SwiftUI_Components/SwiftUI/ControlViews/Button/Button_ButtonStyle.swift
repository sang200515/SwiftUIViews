

import SwiftUI

private struct Button_ButtonStyle: View {
    var body: some View {
        VStack(spacing: 60.0) {
            HeaderView("Button",
                       subtitle: "ButtonStyle",
                       desc: "You can apply preset button styles to your buttons with the buttonStyle modifier.")
            
            Button("Automatic") { }
            .buttonStyle(.automatic)
            
            Button("Bordered") { }
            .buttonStyle(.bordered)
            
            Button("BorderedProminent") { }
            .buttonStyle(.borderedProminent)
            
            Button("Borderless") { }
            .buttonStyle(.borderless)
            
            Button("Plain") { }
            .buttonStyle(.plain)
        }
        .font(.title)
        .tint(.purple)
    }
}

struct Button_ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button_ButtonStyle()
                .preferredColorScheme(.dark)
        }
    }
}
