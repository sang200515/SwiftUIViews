// 12/7/19.
import SwiftUI

private struct Exercise_Spring_AnimateFadeIns: View {
    @State private var start = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                Gradient(colors: [Color("DarkAccent2"), Color("DarkShade2")]),
                           startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Image("Planet")
                    .padding(.vertical, 80)
                    .offset(x: start ? 0 : 400)
                    .animation(.interpolatingSpring(stiffness: 40, damping: 8)
                        .delay(0.3), value: start)
                
                Text("PLANET EXPLORER")
                    .font(.largeTitle).bold()
                    .foregroundColor(Color("LightShade2"))
                    .offset(x: start ? 0 : -400)
                    .animation(.interpolatingSpring(stiffness: 40, damping: 8)
                        .delay(0.3), value: start)
                
                VStack {
                    Text("START")
                        .font(.title)
                        .foregroundColor(Color("LightAccent2"))
                        .scaleEffect(start ? 1 : 0.2)
                        .opacity(start ? 1 : 0)
                        .animation(.interpolatingSpring(stiffness: 25, damping: 5,
                                                                 initialVelocity: 10)
                            .delay(0.9), value: start)
                    
                    Text("EXPLORING!")
                        .font(.title)
                        .foregroundColor(Color("LightAccent2"))
                        .scaleEffect(start ? 1 : 0.2)
                        .opacity(start ? 1 : 0)
                        .animation(.interpolatingSpring(stiffness: 25, damping: 5)
                            .delay(1.3), value: start)
                }
                Button(action: {}) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("LightShade2"))
                        .padding(25)
                        .background(Circle().fill(Color("Accent2")).shadow(radius: 10))
                        .opacity(start ? 1 : 0)
                        .animation(.linear(duration: 1.6).delay(0.3), value: start)
                }
            }.onAppear { start.toggle() }
        }
    }
}

struct Exercise_Spring_AnimateFadeIns_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_Spring_AnimateFadeIns()
    }
}
