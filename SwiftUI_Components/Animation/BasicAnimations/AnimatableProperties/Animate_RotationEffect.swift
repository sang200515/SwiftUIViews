//
//  Animate_Rotation.swift
//  SwiftUIAnimations
//
// 9/30/19.
import SwiftUI

fileprivate struct Animate_RotationEffect: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Rotation Effect")
            BannerText("Rotations are also animatable.", backColor: .blue, textColor: .white)
            
            Button("Change") {
                change.toggle()
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .frame(width: 300, height: 200)
                .overlay(Image(systemName: "arrow.right").foregroundColor(.black))
                .rotationEffect(Angle.degrees(change ? 220 : 0))
                .animation(.easeInOut, value: change)
            
            Spacer()
        }
        .font(.title)
    }
}

struct Animate_RotationEffect_Previews: PreviewProvider {
    static var previews: some View {
        Animate_RotationEffect()
    }
}
