//
//  Animate_ZIndex.swift
//  SwiftUIAnimations
//
// 11/23/19.
import SwiftUI

private struct Animate_ZIndex: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Z Index")
            BannerText("Animating the zIndex modifier doesn't seem to work.", backColor: .blue, textColor: .white)
            
            Button("Change") {
                change.toggle()
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .foregroundColor(.blue)
                    .padding()
                    .animation(.easeInOut, value: change)
                    .padding([.trailing, .bottom], 50)
                    .zIndex(change ? 1 : 0)
                
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .foregroundColor(.orange)
                    .padding()
                    .animation(.easeInOut, value: change)
                    .padding([.leading, .top], 50)
                    .zIndex(change ? 0 : 1)
            }
        }
        .animation(.default, value: change)
        .font(.title)
    }
}

struct Animate_ZIndex_Previews: PreviewProvider {
    static var previews: some View {
        Animate_ZIndex()
    }
}
