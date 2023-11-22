import SwiftUI

private struct TextField_KeyboardSafeArea: View {
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image("Logo")
            Spacer()
            
            HeaderView("TextField",
                       subtitle: "Keyboard Safe Area",
                       desc: "TextFields will automatically move into view when the keyboard appears. The keyboard adjusts the safe area so it will not cover views.",
                       back: .orange)
            
            TextField("user name", text: $userName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            SecureField("password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
        }
        .font(.title)
    }
}

struct TextField_KeyboardSafeArea_Previews: PreviewProvider {
    static var previews: some View {
        TextField_KeyboardSafeArea()
    }
}
