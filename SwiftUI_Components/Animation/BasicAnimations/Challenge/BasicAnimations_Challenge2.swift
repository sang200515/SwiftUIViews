//
//  BasicAnimations_Challenge1.swift
//  SwiftUIAnimations
//
// 10/27/19.
import SwiftUI

fileprivate struct BasicAnimations_Challenge2: View {
    @State private var openMenu = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Challenge")
            SubtitleText("Show a Menu")
            
            Button("Open Menu") {
                openMenu.toggle()
            }
            
            Spacer()
            
            VStack(spacing: 20) {
                Image(systemName: "line.horizontal.3")
                Text("My Menu!")
                Spacer()
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
            .padding(.horizontal)
            .foregroundColor(.white)
            .offset(x: 0, y: openMenu ? 0 : 250)
            .opacity(openMenu ? 1 : 0)
            .scaleEffect(openMenu ? 1 : 0.15, anchor: .bottom)
            .animation(.default, value: openMenu)
        }
    }
}

struct BasicAnimations_Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_Challenge2()
    }
}
