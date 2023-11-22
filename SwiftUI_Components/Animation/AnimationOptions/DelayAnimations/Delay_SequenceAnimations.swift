//
//  Delay_SequenceAnimations.swift
//  SwiftUIAnimations
//
// 11/18/19.
import SwiftUI

private struct Delay_SequenceAnimations: View {
    @State private var show = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Delay")
            SubtitleText("Sequence Animations")
            BannerText("Use the delay to sequence animations.", backColor: .red, textColor: .white)
            Spacer()
            VStack {
                Group {
                    Image(systemName: "1.circle")
                        .opacity(show ? 1 : 0)
                        .animation(.easeIn.delay(0.5), value: show)
                    Image(systemName: "2.circle")
                        .opacity(show ? 1 : 0)
                        .animation(.easeIn.delay(0.9), value: show)
                    Image(systemName: "3.circle")
                        .opacity(show ? 1 : 0)
                        .animation(.easeIn.delay(1.3), value: show)
                }.font(.system(size: 100))
                
                Button("Go!", action: {})
                    .font(.system(size: 70))
                    .foregroundColor(.white)
                    .padding(25)
                    .background(Circle().fill(Color.green))
                    .opacity(show ? 1 : 0)
                    .animation(.easeIn.delay(1.7), value: show)
            }.onAppear { show = true }
            Spacer()
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct Delay_SequenceAnimations_Previews: PreviewProvider {
    static var previews: some View {
        Delay_SequenceAnimations()
    }
}
