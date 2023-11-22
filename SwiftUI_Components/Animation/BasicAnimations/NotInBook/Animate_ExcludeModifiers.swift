//
//  Animate_ExcludeModifiers.swift
//  SwiftUIAnimations
//
// 10/1/19.
import SwiftUI

private struct Animate_ExcludeModifiers: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 10) {
            TitleText("Animatable Properties")
            SubtitleText("Two Modifiers")
            BannerText("You can animate multiple properties at the same time. SwiftUI will interpolate the differences.",
                       backColor: .blue, textColor: .white)
            
            Button("Change") {
                change.toggle()
            }
            
            Spacer()
            Text("Animate color & scale")
            Circle()
                .foregroundColor(change ? Color.blue : Color.orange)
                .scaleEffect(change ? 1.5 : 1)
                .frame(height: 80)
                .padding(40)
                .animation(.easeInOut(duration: 1), value: change)
            
            Text("Animate just the scale")
            // I can't get this to work right. It's not working like in Apple's example.
            Circle()
                .foregroundColor(change ? Color.blue : Color.orange)
                .animation(nil, value: change)
                .scaleEffect(change ? 1.5 : 1)
                .frame(height: 80)
                .padding(40)
                .animation(.easeInOut(duration: 1), value: change)
            
            Spacer()
        }.font(.title)
    }
}

struct Animate_ExcludeModifiers_Previews: PreviewProvider {
    static var previews: some View {
        Animate_ExcludeModifiers()
    }
}
