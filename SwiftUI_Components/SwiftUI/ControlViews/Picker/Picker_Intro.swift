//6/18/19.
import SwiftUI

private struct Picker_Intro : View {
    @State private var favoriteState = 1
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Picker",
                       subtitle: "Introduction",
                       desc: "You can associate a property with the picker rows' tag values.")
            
            Picker("States", selection: $favoriteState) {
                Text("California").tag(0)
                Text("Utah").tag(1)
                Text("Vermont").tag(2)
            }
            
            Spacer()
        }
        .font(.title)
    }
}

struct Picker_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Picker_Intro()
    }
}
