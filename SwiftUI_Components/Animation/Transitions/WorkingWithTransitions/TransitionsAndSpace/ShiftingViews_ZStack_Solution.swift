// 12/19/19.
import SwiftUI

fileprivate struct ShiftingViews_ZStack_Solution: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("ZStack Solution").foregroundColor(Color("LightAccent2"))
                BannerText("Transitions work with views that are inserted and removed from the screen (view hierarchy). Insertion and removal will adjust views around them.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                Button("Change") {
                    change.toggle()
                }
                BannerText("Solution: Use a ZStack and move the view on top of the other views.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
            }
            .font(.title)
            .tint(Color("Accent2"))
            
            if change {
                Image("collaboration")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color("LightShade2"))
                        .shadow(radius: 20))
                    .offset(y: -65)
                    .zIndex(1)
                    .transition(.slide)
            }
        }
        .animation(.default, value: change)
    }
}

struct ShiftingViews_ZStack_Solution_Previews: PreviewProvider {
    static var previews: some View {
        ShiftingViews_ZStack_Solution()
    }
}
