// 12/19/19.
import SwiftUI

fileprivate struct ShiftingViews_Spacer_Solution: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Using Spacer Solution").foregroundColor(Color("LightAccent2"))
                BannerText("Transitions work with views that are inserted and removed from the screen (view hierarchy). Insertion and removal will adjust views around them.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    change.toggle()
                }
                
                Spacer(minLength: 0)
                
                if change {
                    Image("collaboration")
                        .transition(.slide)
                }
                
                Spacer(minLength: 0)
                
                BannerText("Solution: Using spacers and filling the space.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
            }
            .animation(.default, value: change)
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

struct ShiftingViews_Spacer_Solution_Previews: PreviewProvider {
    static var previews: some View {
        ShiftingViews_Spacer_Solution()
    }
}
