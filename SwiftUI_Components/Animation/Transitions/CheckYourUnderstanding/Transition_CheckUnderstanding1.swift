// 12/25/19.
import SwiftUI

private struct Transition_CheckUnderstanding1: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Change") {
                change.toggle()
            }
            
            if change {
                Text("Hello!")
                    .transition(.move(edge: .bottom))
            }
            
            Spacer()
        }
    }
}

struct Transition_CheckUnderstanding1_Previews: PreviewProvider {
    static var previews: some View {
        Transition_CheckUnderstanding1()
    }
}
