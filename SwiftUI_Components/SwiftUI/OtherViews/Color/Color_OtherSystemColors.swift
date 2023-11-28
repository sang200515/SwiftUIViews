//7/8/19.
import SwiftUI

fileprivate struct Color_OtherSystemColors : View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("Color",
                       subtitle: "Other System Colors",
                       desc: "These colors show differently depending on Light or Dark mode.")
            
            Text("Light Mode").font(.title)
            Text("Primary Color")
                .foregroundColor(Color.primary)
            Text("Secondary Color")
                .foregroundColor(Color.secondary)
            Text("Accent Color")
                .foregroundColor(Color.accentColor)
            
            Group {
                Text("Dark Mode").font(.title)
                Text("Primary Color")
                    .foregroundColor(Color.primary)
                Text("Secondary Color")
                    .foregroundColor(Color.secondary)
                Text("Accent Color")
                    .foregroundColor(Color.accentColor)
            }
        }
        .font(.title)
    }
}

struct Color_OtherSystemColors_Previews : PreviewProvider {
    static var previews: some View {
        Color_OtherSystemColors()
    }
}
