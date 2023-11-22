//
//  ZStack_Problem.swift
//  SwiftUIAnimations
//
// 12/19/19.
import SwiftUI

private struct ZStack_Problem: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("ZStack Problem").foregroundColor(Color("LightAccent2"))
                BannerText("When a view in a ZStack has a transition, sometimes it looks as though the removal effect is not working. This is because the view is getting moved UNDER the other layers and cannot be seen.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                Button("Show") {
                    show.toggle()
                }
            }.blur(radius: show ? 10 : 0)
            
            if show {
                VStack {
                    Image("collaboration")
                    Button("Close") {
                        show = false
                    }.padding(.top, 30)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("DarkAccent2"))
                                .shadow(radius: 20))
                .transition(.slide)
            }
        }
        .animation(.default, value: show)
        .font(.title).tint(Color("Accent2"))
    }
}

struct ZStack_Problem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_Problem()
    }
}
