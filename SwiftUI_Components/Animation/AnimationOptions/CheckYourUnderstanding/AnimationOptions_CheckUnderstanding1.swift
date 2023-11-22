//
//  AnimationOptions_CheckUnderstanding1.swift
//  SwiftUIAnimations
//
// 11/27/19.
import SwiftUI

private struct AnimationOptions_CheckUnderstanding1: View {
    @State private var change = false
    @State private var colorChange = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Check Understanding")
            SubtitleText("Prevent Animation")
            BannerText("Prevent the color animation")
            
            Button("Change") {
                change.toggle()
                colorChange.toggle()
            }
            
            RoundedRectangle(cornerRadius: change ? 50 : 0)
                .frame(width: 200, height: 200)
                .foregroundColor(colorChange ? .blue : .orange)
        }
        .font(.title)
    }
}

struct AnimationOptions_CheckUnderstanding1_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptions_CheckUnderstanding1()
    }
}
