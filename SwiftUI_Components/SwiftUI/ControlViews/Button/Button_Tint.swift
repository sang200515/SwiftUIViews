

import SwiftUI

private struct Button_Tint: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("Button",
                       subtitle: "Tint",
                       desc: "The tint can affect button styles differently.")
            
            Button("Bordered - Accent") { }
            .buttonStyle(.bordered)
            .foregroundColor(Color.purple)
            
            Button("Bordered - Tint") { }
            .buttonStyle(.bordered)
            .tint(.purple)
            
            Button("Borderless - Tint") { }
            .buttonStyle(.borderless)
            .tint(.purple)
            
            Button("Button - ForegroundColor") { }
            .buttonStyle(.borderless)
            .foregroundColor(Color.purple)
        }
        .controlSize(.large)
        .font(.title)
    }
}

struct Button_Tint_Previews: PreviewProvider {
    static var previews: some View {
        Button_Tint()
    }
}
