//
//  Combining_MoveAndScale.swift
//  SwiftUIAnimations
//
// 12/19/19.
import SwiftUI

fileprivate struct Combining_MoveAndScale: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Combining Move & Scale").foregroundColor(Color("LightAccent2"))
                BannerText("Here is an example of combining move and scale.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                Spacer()
                
                HStack(alignment: .bottom) {
                    Button(action: {
                            change.toggle()
                    }, label: {
                        Image(systemName: "macwindow")
                    })
                    if change {
                        Image("window")
                            .transition(.move(edge: .leading)
                                .combined(with: .scale(scale: 0.1, anchor: .bottomLeading)))
                    }
                    
                    Spacer()
                }
                .animation(.default, value: change)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            }
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

struct Combining_MoveAndScale_Previews: PreviewProvider {
    static var previews: some View {
        Combining_MoveAndScale()
    }
}
