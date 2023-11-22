// 1/17/20.
import SwiftUI

private struct Curve_CurveBelow: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("Background3").ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("Custom Timing Curve")
                SubtitleText("Curve Below")
                BannerText("The animation will backup before moving forward.",
                           backColor: Color("Secondary3"), textColor: Color("Foreground3"))
                Spacer()
                Button("Send") {
                    show = true
                }
                Spacer()
            }
            .font(.title)
            .tint(Color("Accent3"))
            
            if show {
                VStack {
                    Text("Send a bike?")
                        .font(.title)
                    Image("woman.on.bike")
                    HStack {
                        Button("Yes, Send Now") {
                            withAnimation(.timingCurve(0, -0.3, 1, 0, duration: 0.6)) {
                                show = false
                            }
                        }
                        .padding()
                        .foregroundColor(Color("Foreground3"))
                        .background(Capsule().fill(Color("Accent3")))
                        
                        Button("Cancel") {
                            show = false
                        }.foregroundColor(Color("Accent3"))
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20)
                                .fill(Color("Background3"))
                                .shadow(radius: 8))
                .transition(.slide)
                .zIndex(1)
            }
        }
    }
}

struct Curve_CurveBelow_Previews: PreviewProvider {
    static var previews: some View {
        Curve_CurveBelow()
    }
}
