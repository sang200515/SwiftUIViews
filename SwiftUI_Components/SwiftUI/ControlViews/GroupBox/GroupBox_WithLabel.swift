import SwiftUI

fileprivate struct GroupBox_WithLabel: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView("GroupBox",
                       subtitle: "With Label",
                       desc: "Instead of using your own text label, the GroupBox has one built in.",
                       back: .blue, textColor: .white)
            
            GroupBox("Login (Default text format)") {
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $username)
                    .textFieldStyle(.roundedBorder)
            }
            
            DescView(desc: "You can override the default label formatting.",
                     back: .blue, textColor: .white)
            
            GroupBox {
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $username)
                    .textFieldStyle(.roundedBorder)
            } label: {
                Text("Reset Password")
                            .font(.title2)
                            .fontWeight(.light)
            }
        }
        .font(.title)
    }
}

struct GroupBox_WithLabel_Previews: PreviewProvider {
    static var previews: some View {
        GroupBox_WithLabel()
            .preferredColorScheme(.dark)
    }
}
