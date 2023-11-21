

import SwiftUI

private struct Button_ControlSize: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("Button",
                       subtitle: "ControlSize",
                       desc: "Use controlSize to change the amount of padding around the content of the button.")
            
            Button("Bordered - Mini") { }
            .buttonStyle(.bordered)
            .controlSize(.mini)
            
            Button("Bordered - Small") { }
            .buttonStyle(.bordered)
            .controlSize(.small)
            
            Button("Bordered - Regular") { }
            .buttonStyle(.bordered)
            .controlSize(.regular)
            
            Button("Bordered - Large") { }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            Button(action: {}) {
                Text("Bordered - Large")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
        }
        .tint(.purple)
        .font(.title)
    }
}

struct Button_ControlSize_Previews: PreviewProvider {
    static var previews: some View {
        Button_ControlSize()
    }
}
