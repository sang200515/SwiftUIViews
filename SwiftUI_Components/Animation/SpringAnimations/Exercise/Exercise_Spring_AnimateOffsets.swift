// 12/7/19.
import SwiftUI

private struct Exercise_Spring_AnimateOffsets: View {
    @State private var start = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                Gradient(colors: [Color("DarkAccent2"), Color("DarkShade2")]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Image("Planet")
                    .padding(.vertical, 80)
                    .offset(x: start ? 0 : 400)
                    .animation(.interpolatingSpring(stiffness: 40, damping: 8).delay(0.3), value: start)
                
                Text("PLANET EXPLORER")
                    .font(.largeTitle).bold()
                    .foregroundColor(Color("LightShade2"))
                    .offset(x: start ? 0 : -400)
                    .animation(.interpolatingSpring(stiffness: 40, damping: 8).delay(0.3), value: start)
                
                VStack {
                    Text("START")
                        .font(.title)
                        .foregroundColor(Color("LightAccent2"))
                    
                    Text("EXPLORING!")
                        .font(.title)
                        .foregroundColor(Color("LightAccent2"))
                }
                Button(action: {}) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("LightShade2"))
                        .padding(25)
                        .background(Circle().fill(Color("Accent2")).shadow(radius: 10))
                }
            }.onAppear { start.toggle() }
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                        start.toggle()
                    }
                }
        }
    }
}

struct Exercise_Spring_AnimateOffsets_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_Spring_AnimateOffsets()
    }
}
