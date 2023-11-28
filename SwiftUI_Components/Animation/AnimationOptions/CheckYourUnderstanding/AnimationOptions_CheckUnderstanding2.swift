//
//  AnimationOptions_CheckUnderstanding2.swift
//  SwiftUIAnimations
//
// 11/27/19.
import SwiftUI

fileprivate struct AnimationOptions_CheckUnderstanding2: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Check Understanding")
            SubtitleText("Repeat Forever")
            BannerText("Animate Color Change")
            
            Text("CHALLENGE ME!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .hueRotation(.degrees(change ? 360 : 0))
                .animation(.linear(duration: 10).repeatForever(autoreverses: false), value: change)
        }
        .onAppear {
            change.toggle()
        }
        .font(.title)
    }
}

struct AnimationOptions_CheckUnderstanding2_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptions_CheckUnderstanding2()
    }
}
