//
//  Scope_ChangeSizeInParent.swift
//  SwiftUIAnimations
//
// 12/10/19.
import SwiftUI

private struct Scope_ChangeSizeInParent: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Options")
            SubtitleText("Change Size in Parent")
            BannerText("Put the animation modifier on the parent so all views animate when one changes.", backColor: .yellow, textColor: .black)
            
            HStack {
                Color.yellow
                VStack {
                    Color.yellow.frame(minHeight: 20)
                    Color.green
                        .frame(width: change ? 200 : 100, height: change ? 250 : 100)
                    Color.yellow.frame(minHeight: 20)
                }
                Color.yellow
            }
            
            Color.yellow
            
            Button("Change") {
                change.toggle()
            }
        }
        .font(.title)
        .animation(.default, value: change) // Applies animation to everything within
    }
}

struct Scope_ChangeSizeInParent_Previews: PreviewProvider {
    static var previews: some View {
        Scope_ChangeSizeInParent()
    }
}
