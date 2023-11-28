import SwiftUI

fileprivate struct Button_Role: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("Button",
                       subtitle: "Role",
                       desc: "Use the role parameter to specify the kind of button you have.")
            
            Button("Normal") { }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            Button("Destructive", role: .destructive) { }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            Button("Destructive", role: .destructive) { }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Button("Cancel", role: .cancel) { }
            .buttonStyle(.bordered)
            .controlSize(.large)
        }
        .font(.title)
    }
}

struct Button_Role_Previews: PreviewProvider {
    static var previews: some View {
        Button_Role()
    }
}
