import SwiftUI

fileprivate struct LabeledContent_Content: View {
    var body: some View {
        Form {
            LabeledContent("Opt in to") {
                GroupBox {
                    Toggle("Emails", isOn: .constant(false))
                    Toggle("Texts", isOn: .constant(true))
                }
            }
        }
        .font(.title)
    }
}

struct LabeledContent_Content_Previews: PreviewProvider {
    static var previews: some View {
        LabeledContent_Content()
    }
}
