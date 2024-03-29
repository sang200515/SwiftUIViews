//
//  Repeating_RepeatForever.swift
//  SwiftUIAnimations
//
// 11/19/19.
import SwiftUI

fileprivate struct Repeating_RepeatForever: View {
    @State private var start = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Repeating")
            SubtitleText("Repeat Forever")
            BannerText("You learned how to repeat a number of times, but what if you wanted to repeat forever once started? There's a modifier for that too!", backColor: .green)
            
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
                            .repeatForever(), value: start) // Just keep repeating on and on
            
            Spacer()
            
        }
        .font(.title)
    }
}

struct Repeating_RepeatForever_Previews: PreviewProvider {
    static var previews: some View {
        Repeating_RepeatForever()
    }
}
