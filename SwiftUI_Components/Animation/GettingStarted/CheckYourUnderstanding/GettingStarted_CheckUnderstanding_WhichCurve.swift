
import SwiftUI

private struct GettingStarted_CheckUnderstanding_WhichCurve: View {
    @State private var move = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animation Curves")
            
            Group {
                Text("1")
                GeometryReader { gp in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.easeIn(duration: 2), value: move)
                }
                
                Text("2")
                GeometryReader { gp in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.linear(duration: 2), value: move)
                }
                
                
                Text("3")
                GeometryReader { gp in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.easeOut(duration: 2), value: move)
                }
            }
            
            Button("Move") {
                move.toggle()
            }
        }
        .font(.title)
        .padding(.bottom)
    }
}

struct GettingStarted_CheckUnderstanding_WhichCurve_Previews: PreviewProvider {
    static var previews: some View {
        GettingStarted_CheckUnderstanding_WhichCurve()
    }
}
