//
//  Speed_Intro.swift
//  SwiftUIAnimations
//
// 11/24/19.
import SwiftUI

private struct Speed_Intro: View {
    @State private var change = false
    let duration = 1.0
    
    var body: some View {
        VStack(spacing: 10) {
            TitleText("Speed")
            SubtitleText("Introduction")
            BannerText("Animations have a speed modifier that allows you to slow down or speed up animations.")
            Button("Change") {
                change.toggle()
            }
            Text("Normal")
            Circle()
                .fill(Color.orange)
                .frame(height: 70)
                .offset(x: change ? 170 : -170)
                .animation(.easeInOut(duration: duration), value: change)
            Text("2X Faster")
            Circle()
                .fill(Color.orange)
                .frame(height: 70)
                .offset(x: change ? 170 : -170)
                .animation(.easeInOut(duration: duration).speed(2), value: change)
            Text("Half Slower")
            Circle()
                .fill(Color.orange)
                .frame(height: 70)
                .offset(x: change ? 170 : -170)
                .animation(.easeInOut(duration: duration).speed(0.5), value: change)
        }.font(.title)
    }
}

struct Speed_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Speed_Intro()
    }
}
