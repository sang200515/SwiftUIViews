//7/5/19.
import SwiftUI

fileprivate struct Color_Intro : View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("Color",
                       subtitle: "Colors are Views",
                       desc: "You can treat colors as views with their own frames and modifiers.")
            
            HStack(spacing: 40) {
                Color.pink
                    .frame(width: 88, height: 88)
                
                Color.blue
                    .frame(width: 88, height: 88)
                
                Color.purple
                    .frame(width: 88, height: 88)
                    .cornerRadius(20)
            }
            
            Spacer()
        }
        .font(.title)
    }
}

struct Color_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Color_Intro()
    }
}
