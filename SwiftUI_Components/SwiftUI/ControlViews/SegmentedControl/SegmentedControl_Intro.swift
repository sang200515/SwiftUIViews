//
//6/19/19.
import SwiftUI

fileprivate struct SegmentedControl_Intro : View {
    @State private var dayNight = "day"
    @State private var tab = 1
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Segmented Control (Picker)",
                       subtitle: "Introduction",
                       desc: "Associate the segmented control with an @State variable that will control which segment is selected. The state variable will match each segment's tag value.", back: .pink, textColor: .white)
            
            Picker("", selection: $dayNight) {
                Text("Day").tag("day")
                Text("Night").tag("night")
            }
            .pickerStyle(.segmented)
            .tint(.pink)
            .padding()
            
            Text("With Images:")
            
            Picker("", selection: $tab) {
                Image(systemName: "sun.min").tag(0)
                Image(systemName: "moon").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
        }
        .font(.title)
    }
}

struct SegmentedControl_Intro_Previews : PreviewProvider {
    static var previews: some View {
        SegmentedControl_Intro()
    }
}
