//
//  Testing.swift
//  SwiftUIAnimations
//
// 10/6/19.
import SwiftUI

private struct Testing: View {
    @State private var showMessage = false
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray5).ignoresSafeArea()
            
            VStack {
                Spacer()
                Button(action: {
                    showMessage.toggle()
                }) {
                    Text("SHOW MESSAGE")
                }
            }
            
            if showMessage {
                Text("HELLO WORLD!")
                    .font(.largeTitle)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.pink))
                    .opacity(showMessage ? 1 : 0)
                    .zIndex(1) // Need zIndex so you can see if fade out with animation
            }
        }.animation(.easeOut(duration: 1), value: showMessage)
    }
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}
