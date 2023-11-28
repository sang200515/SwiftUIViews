// 9/30/19.
import SwiftUI

fileprivate struct Spring_BlendDuration_SOQuestion: View {
    @State private var animateChange = false
    @State private var sideToSide = false
    @State private var upAndDown = false
    @State private var blendDuration = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .offset(x: sideToSide ? 150 : -150, y: upAndDown ? 150 : -150)
                .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: blendDuration), value: sideToSide)
                .animation(.spring(response: 5, dampingFraction: 1, blendDuration: blendDuration), value: upAndDown)
            
            Spacer()
            
            HStack {
                Image(systemName: "hare")
                Slider(value: $blendDuration, in: 0...200)
                Image(systemName: "tortoise")
            }
            .foregroundColor(.green).padding()
            
            Text("\(blendDuration)")
            
            Button("Side To Side") {
                withAnimation{
                    sideToSide.toggle()}
            }
            .font(.title)
            
            Button("Up And Down") {
                withAnimation{
                    upAndDown.toggle()}
            }
            .font(.title)
        }
    }
}


struct Spring_BlendDuration_SOQuestion_Previews: PreviewProvider {
    static var previews: some View {
        Spring_BlendDuration_SOQuestion()
    }
}
