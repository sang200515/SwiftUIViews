
import SwiftUI

fileprivate struct GettingStarted_CheckUnderstanding2: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                .offset(x: change ? 120 : 0, y: change ? 300 : 0)
                .animation(.easeOut, value: change)
            
            Spacer()
            
            Button("Change") {
                change.toggle()
            }
        }
    }
}

struct GettingStarted_CheckUnderstanding2_Previews: PreviewProvider {
    static var previews: some View {
        GettingStarted_CheckUnderstanding2()
    }
}
