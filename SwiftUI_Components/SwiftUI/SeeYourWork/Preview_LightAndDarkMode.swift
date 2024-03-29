//9/27/19.
import SwiftUI

fileprivate struct Preview_LightAndDarkMode: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Previews",
                       subtitle: "Light & Dark Modes Together",
                       desc: "Use Color Scheme Variants to see light and dark modes together.",
                       back: .red,
                       textColor: .white)
        }
        .font(.title)
    }
}

struct Preview_LightAndDarkMode_Previews: PreviewProvider {
    static var previews: some View {
        Preview_LightAndDarkMode()
    }
}
