//
//  Scope_DifferentAnimations.swift
//  SwiftUIAnimations
//
// 10/31/19.
import SwiftUI

private struct Scope_DifferentAnimations: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Options")
            SubtitleText("Scope - Different Animations")
            BannerText("With the animation modifier on the top-most parent, all children views will animate. To override the animation, just use another animation modifier.", backColor: .yellow, textColor: .black)
            
            Button("Change") {
                change.toggle()
            }
            
            Text("Uses Parent Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(change ? .yellow : .red)
                .frame(width: 100, height: 100)
                .offset(x: change ? 140 : -140, y: 0)
            
            Text("Uses Own Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(change ? .yellow : .orange)
                .frame(width: 100, height: 100)
                .offset(x: change ? 140 : -140, y: 0)
                .animation(.easeIn, value: change) // Use own animation
        }
        .font(.title)
        .animation(.easeOut, value: change) // This applies to all children within
    }
}

struct Scope_DifferentAnimations_Previews: PreviewProvider {
    static var previews: some View {
        Scope_DifferentAnimations()
    }
}
