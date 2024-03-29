//
//  Scope_WithAnimation.swift
//  SwiftUIAnimations
//
// 11/23/19.
import SwiftUI

fileprivate struct Scope_WithAnimation: View {
    @State private var flipHorizontally = false
    
    var body: some View {
        VStack(spacing: 0) {
            TitleText("With Animation")
            SubtitleText("Introduction")
            BannerText("The withAnimation closure says, 'Anything that changes as a result of any values changing inside this closure will use this animation.",
                       backColor: .yellow, textColor: .black)
            
            Button(action: {
                withAnimation {
                    // Animate any visual changes this causes
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
                .scaleEffect(x: flipHorizontally ? -1 : 1, y: 1) // Will change with animation
            
        }
        .font(.title)
    }
}

struct Scope_WithAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Scope_WithAnimation()
    }
}
