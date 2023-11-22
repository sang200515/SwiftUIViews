//
//  Transition_Scale.swift
//  SwiftUIAnimations
//
// 12/18/19.
import SwiftUI

private struct Transition_Scale: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea(edges: .vertical)
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Scale").foregroundColor(Color("LightAccent2"))
                BannerText("Come into view from the scale specified.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                        change.toggle()
                }
                Spacer()
                
                if change {
                    Image("driving")
                        .transition(.scale(scale: 3).animation(.default))
                }
                
                Spacer()
            }
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

struct Transition_Scale_Previews: PreviewProvider {
    static var previews: some View {
        Transition_Scale()
    }
}
