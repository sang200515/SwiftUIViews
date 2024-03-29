//
//  DelayAnimations.swift
//  SwiftUIAnimations
//
// 11/18/19.
import SwiftUI

fileprivate struct DelayAnimations: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Delay Animations")
            SubtitleText("Introduction")
            BannerText("You can delay an animation after it is triggered.",
                       backColor: .red, textColor: .white)
            Text("Wait 1.5 second after this view loads before animating.").padding(.horizontal)
            GeometryReader { geometry in
                ZStack {
                    VStack {
                        Text("Hello!")
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                    }.font(.system(size: 50))
                    
                    HStack(spacing: 0) {
                        Rectangle()
                            .offset(x: change ? -geometry.size.width / 2 : 0)
                        Rectangle()
                            .offset(x: change ? geometry.size.width / 2 : 0)
                    }
                    .foregroundColor(.red)
                    .animation(.default.delay(1.5), value: change) // Delay the animation
                }
            }
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            // Trigger the animation
            change = true
        }
    }
}

struct DelayAnimations_Previews: PreviewProvider {
    static var previews: some View {
        DelayAnimations()
    }
}
