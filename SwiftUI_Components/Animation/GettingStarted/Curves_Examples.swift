
import SwiftUI

fileprivate struct Curves_Examples: View {
    @State private var move = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Curves")
            SubtitleText("Examples")
            BannerText("There are 4 preset animation curves available to you.")
                .layoutPriority(1)
            
            Group {
                Text("easeInOut & default: Slow, faster, slow").font(.title2)
                // Using geometry reader to get the size of the device.
                // Move the circle the width of the device - 40 points.
                GeometryReader { gp in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.easeInOut(duration: 2), value: move)
                }
                
                Text("easeIn: Start slow")
                GeometryReader { gp in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.easeIn(duration: 2), value: move)
                }
                
                Text("easeOut: Slows at end")
                GeometryReader { gp in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.easeOut(duration: 2), value: move)
                }
                
                Text("linear: Same speed")
                GeometryReader { gp  in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.linear(duration: 2), value: move)
                }
            }
            
            Button("Move") {
                move.toggle()
            }
        }
        .font(.title)
        .padding(.bottom, 40)
    }
}

struct Curves_Examples_Previews: PreviewProvider {
    static var previews: some View {
        Curves_Examples()
    }
}
