//
//  Animate_RotationEffect_Anchors.swift
//  SwiftUIAnimations
//
// 10/27/19.
import SwiftUI

fileprivate struct Animate_RotationEffect_Anchors: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 15) {
            TitleText("Animatable Properties")
            SubtitleText("Rotation Around Anchors")
            BannerText("You can rotate around an anchor of your choosing. The default is rotating around the center anchor.",
                       backColor: .blue, textColor: .white)
            
            Button("Change") {
                change.toggle()
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .shadow(radius: 8)
                .frame(width: 320, height: 200)
                .overlay(Text("Rotate from top left").foregroundColor(.white))
                .rotationEffect(Angle.degrees(change ? 220 : 0), anchor: .topLeading)
                .animation(.easeInOut, value: change)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .shadow(radius: 8)
                .frame(width: 320, height: 200)
                .overlay(Text("Rotate from bottom right").foregroundColor(.white))
                .rotationEffect(Angle.degrees(change ? 220 : 0), anchor: .bottomTrailing)
                .animation(.easeInOut, value: change)
            
            Spacer()
            
        }.font(.title)
    }
}

struct Animate_RotationEffect_Anchors_Previews: PreviewProvider {
    static var previews: some View {
        Animate_RotationEffect_Anchors()
    }
}
