// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

fileprivate struct AnimatableModifiers_Intro: View {
    @State private var largerFont = false
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("Animatable Modifiers")
            SubtitleText("Introduction")
            BannerText("There are some modifiers that do not animate, such as font size. Use Animatable in your ViewModifier to change this.",
                       backColor: Color("Gold"))
            
            Button("Change Font Size") {
                withAnimation(.spring(dampingFraction: 0.5)) {
                    largerFont.toggle()
                }
            }
            .font(.title)
            
            Text("Not Animatable")
                .font(.system(size: largerFont ? 50 : 30))
            
            Text("Is Animatable")
                .modifier(FontSize(size: largerFont ? 50 : 30))
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                        withAnimation(.spring(dampingFraction: 0.5)) {
                            largerFont.toggle()
                        }
                    }
                }
            Spacer()
              
        }
    }
}

private struct FontSize: Animatable, ViewModifier {
    var size: Double
    
    var animatableData: Double {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size))
    }
}

struct AnimatableModifiers_Intro_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableModifiers_Intro()
    }
}
