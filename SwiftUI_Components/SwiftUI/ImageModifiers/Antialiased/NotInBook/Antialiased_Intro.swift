//
//  Antialiased_Intro.swift
//  100Views
//
//9/16/19.
import SwiftUI

fileprivate struct Antialiased_Intro: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Antialiased").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("I see no difference here.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.green)
                .layoutPriority(1)
                .foregroundColor(.white)
            Text("Antialiased Off")
            Image("frame")
                .resizable()
                .interpolation(Image.Interpolation.none)
                .antialiased(false)
            
            Text("Antialiased On")
            Image("frame")
                .resizable()
                .interpolation(Image.Interpolation.none)
                .antialiased(true)
        }.font(.title)
    }
}

struct Antialiased_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Antialiased_Intro()
    }
}
