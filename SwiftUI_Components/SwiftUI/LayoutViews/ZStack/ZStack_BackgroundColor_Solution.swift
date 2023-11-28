//
//  ZStack_BackgroundColor_Solution.swift
//  SwiftUI_Views
//
//9/30/19.
import SwiftUI

fileprivate struct ZStack_BackgroundColor_Solution: View {
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea() // Have JUST the color ignore the safe areas edges, not the VStack.
            
            VStack(spacing: 20) {
                Text("ZStack")
                    .font(.largeTitle)
                
                Text("Color Ignores Safe Area Edges")
                    .foregroundColor(.white)
                
                Text("To solve the problem, you want just the color (bottom layer) to ignore the safe area edges and fill the screen. Other layers above it will stay within the Safe Area.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                Spacer()
            }
            .font(.title)
        }
    }
}

struct ZStack_BackgroundColor_Solution_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_BackgroundColor_Solution()
    }
}
