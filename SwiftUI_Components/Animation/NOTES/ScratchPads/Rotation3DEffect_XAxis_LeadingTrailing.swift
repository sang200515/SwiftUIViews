//
//  Rotation3DEffect_XAxis_LeadingTrailing.swift
//  SwiftUIAnimations
//
// 10/4/19.
import SwiftUI

fileprivate struct Rotation3DEffect_XAxis_Top: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Rotation3DEffect")
            SubtitleText("Top Anchors")
            BannerText("An anchor is where the rotation pivots on. By default, the anchor is in the center. You can move the anchor to different sides of the view.")
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.orange)
                .frame(width: 400, height: 200)
                .overlay(Text("Rotations are fun!"))
                .rotation3DEffect(Angle.degrees(change ? 180 : 0),
                                  axis: (x: 1, y: 0, z: 0),
                                  anchor: .top) // Add a third param for the anchor
                .animation(.easeInOut(duration: 1), value: change)
            
            Button("Change") {
                change.toggle()
            }
        }.font(.title)
    }
}

struct Rotation3DEffect_XAxis_Top_Previews: PreviewProvider {
    static var previews: some View {
        Rotation3DEffect_XAxis_Top()
    }
}
