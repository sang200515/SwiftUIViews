// 1/17/20.
import SwiftUI

fileprivate struct Curve_ReadingCurves2: View {
        @State private var change = false
        
        var body: some View {
            ZStack {
                Color("Background3").ignoresSafeArea()
                
                VStack(spacing: 20) {
                    TitleText("Custom Timing Curve")
                    SubtitleText("Reading Curves")
                    BannerText("Very Fast, Slow, Slower", backColor: Color("Secondary3"), textColor: Color("Foreground3"))
                    
                    Image("ReadingCurves2")
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("Tertiary3"))
                        .frame(width: 100, height: 100)
                        .offset(x: change ? 140 : -140, y: 0)
                        .animation(.timingCurve(0, 0.85, 0.15, 1, duration: 1), value: change)
                    
                    Spacer()
                    
                    Button("Change") {
                        change.toggle()
                    }
                }
                .font(.title)
                .tint(Color("Accent3"))
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                        change.toggle()
                    }
                }
            }
        }
    }

struct Curve_ReadingCurves2_Previews: PreviewProvider {
    static var previews: some View {
        Curve_ReadingCurves2()
    }
}
