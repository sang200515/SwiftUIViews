import SwiftUI

fileprivate struct Preview_InterfaceOrientation: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("Previews",
                       subtitle: "PreviewInterfaceOrientation",
                       desc: "Use previewInterfaceOrientation to change your preview to landscape mode (right or left).",
                       textColor: .white)
        }
        .font(.title)
    }
}

struct Preview_InterfaceOrientation_Previews: PreviewProvider {
    static var previews: some View {
        Preview_InterfaceOrientation()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
