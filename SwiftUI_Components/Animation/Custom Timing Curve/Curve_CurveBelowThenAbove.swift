// 1/17/20.
import SwiftUI

fileprivate struct Curve_CurveBelowThenAbove: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("Background3").ignoresSafeArea()
            
            VStack(spacing: 15) {
                TitleText("Custom Timing Curve")
                SubtitleText("Curve Below & Above")
                BannerText("The view will BACKUP and then go BEYOND its destination.",
                           backColor: Color("Secondary3"), textColor: Color("Foreground3"))
                
                Image("BezierCoordinates5")
                
                Spacer()
                
                HStack {
                    HStack(spacing: 16) {
                        Button(action: {}) { Image(systemName: "wand.and.rays.inverse") }
                        Button(action: {}) { Image(systemName: "dial.fill") }
                        Button(action: {}) { Image(systemName: "paintbrush.fill") }
                        Button(action: {}) { Image(systemName: "bandage.fill") }
                        Button(action: {
                            show.toggle()
                        }) { Image(systemName: "line.horizontal.3.decrease") }
                        .rotationEffect(.degrees(-90))
                        .offset(x: 10)
                    }
                    .font(.largeTitle)
                    .padding()
                    .padding(.leading, 60)
                    .background(Capsule().fill(Color("Secondary3")))
                    .offset(x: show ? -60 : -320)
                    .animation(.timingCurve(0.5, -0.5, 0.5, 1.5, duration: 0.8), value: show)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .font(.title)
            .tint(Color("Accent3"))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                    show.toggle()
                }
            }
        }
    }
}

struct Curve_CurveBelowThenAbove_Previews: PreviewProvider {
    static var previews: some View {
        Curve_CurveBelowThenAbove()
    }
}
