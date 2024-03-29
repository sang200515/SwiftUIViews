
// 11/1/19.
import SwiftUI

fileprivate struct Trigger_Gesture_LongPress: View {
    @State private var isLongPressed = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Triggers")
            SubtitleText("Long Press Gesture")
            BannerText("You can start an animation with a long press gesture.",
                       backColor: .green)
            
            Spacer()
            
            Circle()
                .fill(isLongPressed ? Color.blue : Color.green)
                .frame(width: 200, height: 200)
                .overlay(Text("Long Press"))
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 5)
                        .scaleEffect(isLongPressed ? 2 : 1)
                        .opacity(isLongPressed ? 0 : 1))
                .onLongPressGesture {
                    isLongPressed.toggle()
                }
                .animation(.default, value: isLongPressed) // Animate changes when long press completes
            
            Spacer()
            
        }
        .font(.title)
    }
}

struct Trigger_Gesture_LongPress_Previews: PreviewProvider {
    static var previews: some View {
        Trigger_Gesture_LongPress()
    }
}
