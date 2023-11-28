//
//  Transition_Intro.swift
//  SwiftUIAnimations
//
// 12/17/19.
import SwiftUI

fileprivate struct Transition_Intro: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea(edges: .vertical)
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Introduction").foregroundColor(Color("LightAccent2"))
                BannerText("Use the transition modifier to specify how a view enters and exits the screen.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    // Second most reliable option:
                    // withAnimation {
                    change.toggle()
                    // }
                }
                
                Spacer()
                
                // Most reliable option:
                Group {
                    if change {
                        Image("driving")
                            .transition(AnyTransition.slide)
                    }
                }
                .animation(.default, value: change)
                
                Spacer()
            }
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

struct Transition_Intro_Previews: PreviewProvider {
    static var previews: some View {
        VStack { // Adding VStack to be able to preview animation is a workaround
            Transition_Intro()
        }
    }
}
