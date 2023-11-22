
import SwiftUI

private struct GettingStarted_CheckUnderstanding: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                .offset(x: change ? 60 : 0, y: 0)
            
            Button("Change") {
                change.toggle()
            }
        }
    }
}

struct GettingStarted_CheckUnderstanding_Previews: PreviewProvider {
    static var previews: some View {
        GettingStarted_CheckUnderstanding()
    }
}
