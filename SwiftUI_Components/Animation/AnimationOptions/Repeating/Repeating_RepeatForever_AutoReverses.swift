//
//  Repeating_RepeatForever_AutoReverses.swift
//  SwiftUIAnimations
//
// 11/20/19.
import SwiftUI

private struct Repeating_RepeatForever_AutoReverses: View {
    @State private var start = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Repeating")
            SubtitleText("Repeat Forever: No Auto-Reverse")
            BannerText("There is an optional autoreverses parameter that is set to true by default. Let's set it to false so the animation just goes one direction.", backColor: .green)
            
            Spacer()
            
            Button("Start", action: { start = true })
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 4)
                        .scaleEffect(start ? 2 : 1)
                        .opacity(start ? 0 : 1))
                .animation(Animation.easeOut(duration: 0.6)
                    .repeatForever(autoreverses: false), value: start) // Do not reverse the animation
            
            Spacer()
            
        }
        .font(.title)
    }
}

struct Repeating_RepeatForever_AutoReverses_Previews: PreviewProvider {
    static var previews: some View {
        Repeating_RepeatForever_AutoReverses()
    }
}
