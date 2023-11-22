// 12/19/19.
import SwiftUI

private struct ShiftingViews_Problem: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Shifting Views Problem").foregroundColor(Color("LightAccent2"))
                BannerText("Transitions work with views that are inserted and removed from the screen (view hierarchy). Insertion and removal will adjust views around them.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    change.toggle()
                }
                
                if change {
                    Image("collaboration")
                        .transition(.slide)
                }
                
                BannerText("Notice what happens when the view is inserted here.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
            }
            .animation(.default, value: change)
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

struct ShiftingViews_Problem_Previews: PreviewProvider {
    static var previews: some View {
        ShiftingViews_Problem()
    }
}
