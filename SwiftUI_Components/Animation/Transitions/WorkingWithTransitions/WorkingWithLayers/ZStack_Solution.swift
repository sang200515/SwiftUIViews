//
//  ZStack_Solution.swift
//  SwiftUIAnimations
//
// 12/19/19.
import SwiftUI

fileprivate struct ZStack_Solution: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("ZStack Solution").foregroundColor(Color("LightAccent2"))
                BannerText("The solution is pretty simple. You just need to add zIndex modifier to the view with the transition.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
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
                .zIndex(1)
            }
        }
        .animation(.default, value: show)
        .font(.title).tint(Color("Accent2"))
    }
}

struct ZStack_Solution_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_Solution()
    }
}
