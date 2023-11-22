// 12/25/19.
import SwiftUI

private struct Transition_CheckUnderstanding2: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Change") {
                change.toggle()
            }
            
            if change {
                Text("Hello!")
                    .transition(.move(edge: .bottom)
                        .combined(with: .scale(scale: 1.5)))
                    .animation(.default, value: change)
            }
            
            Spacer()
        }
    }
}

struct Transition_CheckUnderstanding2_Previews: PreviewProvider {
    static var previews: some View {
        Transition_CheckUnderstanding2()
    }
}
