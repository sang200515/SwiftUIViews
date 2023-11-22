// 1/10/20.
import SwiftUI

private struct Curve_TimingCurveModifier1: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("Background3").ignoresSafeArea()
            
            VStack(spacing: 5) {
                TitleText("Custom Timing Curve")
                SubtitleText("X & Y Coordinates")
                BannerText("By defining the X & Y coordinates of the two Bézier handles of the curve, you can create a custom timing curve.",
                           backColor: Color("Secondary3"), textColor: Color("Foreground3"))
                Image("BezierCoordinates1")
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("Tertiary3"))
                    .frame(width: 100, height: 100)
                    .overlay(Text("Linear"))
                    .offset(x: change ? 140 : -140, y: 0)
                    .animation(.linear(duration: 1), value: change)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("Tertiary3"))
                    .frame(width: 100, height: 100)
                    .overlay(Text("Custom"))
                    .offset(x: change ? 140 : -140, y: 0)
                    .animation(.timingCurve(0.1, 0.7, 0.9, 0.3, duration: 1), value: change)
                Spacer()
                Button("Change") {
                    change.toggle()
                }
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                        change.toggle()
                    }
                }
            }
            .font(.title)
            .tint(Color("Accent3"))
        }
    }
}

struct Curve_TimingCurveModifier1_Previews: PreviewProvider {
    static var previews: some View {
        Curve_TimingCurveModifier1()
    }
}
