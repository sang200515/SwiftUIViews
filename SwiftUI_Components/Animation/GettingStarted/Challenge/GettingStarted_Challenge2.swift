
import SwiftUI

fileprivate struct GettingStarted_Challenge2: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Challenge")
            SubtitleText("Move the Circle Shape")
            
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                .offset(x: 0, y: change ? 550 : 0)
                .animation(.linear, value: change)
            
            Spacer()
            
            Button("Change") {
                change.toggle()
            }
            .padding(.bottom)
        }
        .font(.title)
    }
}

struct GettingStarted_Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        GettingStarted_Challenge2()
    }
}
