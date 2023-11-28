// 12/25/19.
import SwiftUI

fileprivate struct If_Else_Solution: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2").ignoresSafeArea()
            
            VStack(spacing: 30) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("If Else Solution").foregroundColor(Color("LightAccent2"))
                BannerText("What you will have to do is put each view into its own if statement to get it to work properly.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    change.toggle()
                }.padding(.bottom)
                
                if change {
                    Image("reading.book.female")
                        .transition(.move(edge: .leading))
                }
                
                if change == false {
                    Image("reading.book.male")
                        .transition(.move(edge: .trailing))
                }
                
                Spacer()
            }
            .animation(.default, value: change)
        }
        .font(.title)
        .tint(Color("Accent2"))
    }
}

struct If_Else_Solution_Previews: PreviewProvider {
    static var previews: some View {
        If_Else_Solution()
    }
}
