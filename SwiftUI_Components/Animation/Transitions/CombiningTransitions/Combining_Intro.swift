//
//  Combining_Intro.swift
//  SwiftUIAnimations
//
// 12/19/19.
import SwiftUI

fileprivate struct Combining_Intro: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Combining Introduction").foregroundColor(Color("LightAccent2"))
                BannerText("You can combine transition effects to work together. For example, here is the combination of slide and opacity.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    change.toggle()
                }
                Spacer()
                
                if change {
                    Image("window")
                        .transition(AnyTransition.slide.combined(with: .opacity))
                }
                
                Spacer()
            }
            .animation(.default, value: change)
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

struct Combining_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Combining_Intro()
    }
}
