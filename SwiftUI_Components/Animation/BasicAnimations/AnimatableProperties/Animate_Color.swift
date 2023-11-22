//
//  Animate_Color.swift
//  SwiftUIAnimations
//
// 9/30/19.
import SwiftUI

private struct Animate_Color: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Color")
            BannerText("You can animate the change from one color to another.",
                       backColor: .blue, textColor: .white)
            
            Text("With Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(change ? .orange : .blue)
                .padding()
                .animation(.easeInOut, value: change)
            
            Text("No Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(change ? .orange : .blue)
                .padding()
            
            Button("Change") {
                change.toggle()
            }
        }
        .font(.title)
    }
}

struct Animate_Color_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Color()
    }
}
