import SwiftUI

fileprivate struct ClipShape_WithText: View {
    var body: some View {
        Text("Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! ")
            .clipShape(Circle())
    }
}

struct ClipShape_WithText_Previews: PreviewProvider {
    static var previews: some View {
        ClipShape_WithText()
    }
}
