//6/12/19.
import SwiftUI

fileprivate struct Color_AsBackground : View {
    var body: some View {
        ZStack {
            Color("ColorBackground")
                .ignoresSafeArea()
            
            // Your main view content here
            VStack(spacing: 20) {
                HeaderView("Color",
                           subtitle: "Using As Background",
                           desc: "With a ZStack, you can set a Color view as the background color.")
                
                Text("(Background in Dark Mode)")
                    .padding(.top, 150)
            }
        }
        .font(.title)
    }
}

struct Color_AsBackground_Previews : PreviewProvider {
    static var previews: some View {
        Color_AsBackground()
    }
}
