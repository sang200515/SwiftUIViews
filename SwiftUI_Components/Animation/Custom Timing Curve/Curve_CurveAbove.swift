import SwiftUI

fileprivate struct Curve_CurveAbove: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("Background3").ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("Custom Timing Curve")
                SubtitleText("Curve Above")
                BannerText("The view goes BEYOND its destination then comes back.",
                           backColor: Color("Secondary3"), textColor: Color("Foreground3"))
                    .fixedSize(horizontal: false, vertical: true)
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
                            show = false
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
                .transition(AnyTransition.slide)
                .zIndex(1)
            }
        }
        .animation(.timingCurve(0, 0, 0, 1.5, duration: 0.8), value: show)
    }
}

struct Curve_CurveAbove_Previews: PreviewProvider {
    static var previews: some View {
        Curve_CurveAbove()
    }
}
