

import SwiftUI

private struct Button_Disabled: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Button",
                       subtitle: "Disabled",
                       desc: "Use the disabled modifier to prevent the user from interacting with controls.")
            
            Button("Enabled") { }
            .controlSize(.large)

            Button("Disabled") { }
            .controlSize(.large)
            .disabled(true)
            
            Button("Enabled") { }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Button("Disabled") { }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(true)
        }
        .font(.title)
        .tint(.purple)
    }
}

struct Button_Disabled_Previews: PreviewProvider {
    static var previews: some View {
        Button_Disabled()
    }
}
