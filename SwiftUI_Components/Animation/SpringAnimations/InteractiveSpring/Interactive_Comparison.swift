//
//  Interactive_Intro.swift
//  SwiftUIAnimations
//
// 12/2/19.
import SwiftUI

fileprivate struct Interactive_Comparison: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                TitleText("Interactive Spring").foregroundColor(Color("Gold"))
                SubtitleText("Comparison")
                BannerText("Here is a comparison between the spring and interactiveSpring animations.", backColor: Color("Gold"))
                Button("Change") {
                    change.toggle()
                }
                HStack(alignment: .top, spacing: 50.0) {
                    VStack {
                        Text("spring")
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 100, height: change ? 400 : 100)
                            .animation(.spring(), value: change)
                    }
                    VStack {
                        Text("interactiveSpring")
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 100, height: change ? 400 : 100)
                            .animation(.interactiveSpring(), value: change)
                    }
                }.foregroundColor(.white)
                Spacer()
            }.font(.title)
        }
    }
}

struct Interactive_Comparison_Previews: PreviewProvider {
    static var previews: some View {
        Interactive_Comparison()
    }
}
