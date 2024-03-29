//
//  Animate_Size.swift
//  SwiftUIAnimations
//
// 9/30/19.
import SwiftUI

fileprivate struct Animate_Size_ScaleEffect: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Scale Effect")
            BannerText("You can animate the size of an object through the scaleEffect modifier values.",
                       backColor: .blue, textColor: .white)
            
            Button("Change") {
                change.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .padding()
                .scaleEffect(change ? 0.1 : 1)
                .animation(.easeInOut, value: change)
            
            BannerText("Notice how scaleEffect does NOT modify the layout.",
                       backColor: .blue, textColor: .white)
            
        }
        .font(.title)
    }
}

struct Animate_Size_ScaleEffect_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Size_ScaleEffect()
    }
}
