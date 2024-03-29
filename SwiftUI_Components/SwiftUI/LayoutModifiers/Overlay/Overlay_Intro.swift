//
//  Overlay_Intro.swift
//  100Views
//
//8/23/19.
import SwiftUI

fileprivate struct Overlay_Intro: View {
    var body: some View {
        Color("Theme3BackgroundColor")
            .overlay(
                VStack(spacing: 20) {
                    Text("Overlay")
                        .font(.largeTitle)
                    
                    Text("Example")
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    Image("Overlay")
                    
                    Text("In this example, we see a VStack on top of a Color view. This is another way in which you can provide a background color on a screen.")
                        .frame(maxWidth: .infinity)
                        .padding().font(.title)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                }
                , alignment: .center)
            .ignoresSafeArea()
    }
}

struct Overlay_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Overlay_Intro()
    }
}
