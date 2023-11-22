
// This was fixed in a later version of SwiftUI.
import SwiftUI

private struct Animate_InsideIfInZStack: View {
    @State private var showMessage = false
    
    var body: some View {
        ZStack {
            // Remove this background color and it works as expected
            Color.red.ignoresSafeArea()
            
            VStack {
                Spacer()
                Button(action: {
                    showMessage.toggle()
                }) {
                    Text("SHOW MESSAGE")
                }
            }
            
            Text("HELLO WORLD!")
                .opacity(showMessage ? 1 : 0)
                .animation(.easeOut(duration: 2), value: showMessage)
        }
    }
}

struct Animate_InsideIfInZStack_Previews: PreviewProvider {
    static var previews: some View {
        Animate_InsideIfInZStack()
    }
}
