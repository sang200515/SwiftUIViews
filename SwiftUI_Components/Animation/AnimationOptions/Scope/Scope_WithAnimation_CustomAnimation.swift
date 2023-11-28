//
//  Scope_WithAnimation_CustomAnimation.swift
//  SwiftUIAnimations
//
// 11/24/19.
import SwiftUI

fileprivate struct Scope_WithAnimation_CustomAnimation: View {
    @State private var flipHorizontally = false
    
    var body: some View {
        VStack(spacing: 0) {
            TitleText("With Animation")
            SubtitleText("Custom Animations")
            BannerText("Using just withAnimation gives you the default animation. You can also customize the curve, duration, etc just like the previous animations you learned about.",
                       backColor: .yellow, textColor: .black)
            
            Button(action: {
                // Customize the animation
                withAnimation(Animation.easeOut(duration: 1)) {
                    flipHorizontally.toggle()
                }
            }) {
                Image(systemName: "flip.horizontal.fill")
                    .font(.system(size: 50))
                    .padding()
            }
            
            Image("day")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(30)
                .padding()
                .scaleEffect(x: flipHorizontally ? -1 : 1, y: 1)
        }
        .font(.title)
    }
}

struct Scope_WithAnimation_CustomAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Scope_WithAnimation_CustomAnimation()
    }
}
