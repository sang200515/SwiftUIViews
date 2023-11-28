//
//  Repeating_RepeatCount_AutoReverses.swift
//  SwiftUIAnimations
//
// 11/20/19.
import SwiftUI

fileprivate struct Repeating_RepeatCount_AutoReverses: View {
    @State private var start = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Repeating")
            SubtitleText("Repeat Count Auto-Reverses")
            BannerText("Auto-Reverse is true by default. It is an optional parameter that you can set to false.", backColor: .green)
            
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
                            .repeatCount(3, autoreverses: false), value: start) // Do not reverse!
            
            Spacer()
            
        }
        .font(.title)
    }
}

struct Repeating_RepeatCount_AutoReverses_Previews: PreviewProvider {
    static var previews: some View {
        Repeating_RepeatCount_AutoReverses()
    }
}
