//
//  Spring_Color.swift
//  SwiftUIAnimations
//
// 9/30/19.
import SwiftUI

fileprivate struct Spring_Color: View {
        @State private var change = false
        @State private var dampingFraction = 0.5
        
        var body: some View {
            VStack(spacing: 10) {
                TitleText("Spring")
                SubtitleText("Color")
                BannerText("The spring animation can be used on color too.", backColor: .green)
                
                Circle()
                    .padding()
                    .foregroundColor(change ? .blue : .green)
                    .animation(.spring(dampingFraction: dampingFraction), value: change)
                
                HStack {
                    Image(systemName: "0.circle.fill")
                    Slider(value: $dampingFraction)
                    Image(systemName: "1.circle.fill")
                }.foregroundColor(.green).padding()
                
                Button("Change") {
                    change.toggle()
                }
            }.font(.title)
        }
    }
struct Spring_Color_Previews: PreviewProvider {
    static var previews: some View {
        Spring_Color()
    }
}
