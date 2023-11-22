// 12/25/19.
import SwiftUI

private struct If_Else_Scenario: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Scenario").foregroundColor(Color("LightAccent2"))
                BannerText("You have a scenario where you want to move one view out while moving another view in like this:",
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

struct If_Else_Scenario_Previews: PreviewProvider {
    static var previews: some View {
        If_Else_Scenario()
    }
}
