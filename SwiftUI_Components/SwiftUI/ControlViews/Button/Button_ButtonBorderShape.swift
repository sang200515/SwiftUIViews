import SwiftUI

private struct Button_ButtonBorderShape: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("Button",
                       subtitle: "ButtonBorderShape",
                       desc: "Set a button's shape to capsule or rounded rectangle on bordered and bordered prominent buttons.")
            
            Button("Automatic") { }
            .buttonStyle(.bordered)
            .buttonBorderShape(.automatic)
            .controlSize(.large)
            
            Button("Automatic") { }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.automatic)
            .controlSize(.large)
            
            Button("Capsule") { }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
            Button("RoundedRectangle") { }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
            
            Button("Set Radius") { }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 0))
            .controlSize(.large)
        }
        .font(.title)
        .tint(.purple)
    }
}

struct Button_ButtonBorderShape_Previews: PreviewProvider {
    static var previews: some View {
        Button_ButtonBorderShape()
    }
}
