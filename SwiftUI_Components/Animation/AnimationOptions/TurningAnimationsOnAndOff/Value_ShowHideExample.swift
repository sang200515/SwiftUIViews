//
//  Value_ShowHideExample.swift
//  SwiftUIAnimations
//
// 12/4/19.
import SwiftUI

fileprivate struct Value_ShowHideExample: View {
    @State private var showCard = false
    @State private var animateOnChange = false
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Value")
            SubtitleText("Show & Hide Example")
            BannerText("Here is an example of using the value parameter to turn off every other animation. You want to animate showing a card but then no animation when hiding it.",
                       backColor: .blue, textColor: .white)
            Button(action: {
                showCard.toggle()
                animateOnChange.toggle() // Only animate from this button
            }) {
                Image(systemName: "creditcard").font(.largeTitle)
            }
            VStack {
                HStack {
                    Spacer()
                    Text("Get the Card")
                    Spacer()
                    Button(action: {
                        showCard.toggle() // No animation (animateOnChange isn't changing)
                    }) {
                        Text("X").font(.body).padding(8)
                    }.background(Circle().stroke(Color.white))
                }.foregroundColor(.white)
                Image("Card")
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.blue))
            .padding(.horizontal)
            .offset(x: showCard ? 0 : -400)
            .animation(.default, value: animateOnChange)
            
        }.font(.title)
    }
}

struct Value_ShowHideExample_Previews: PreviewProvider {
    static var previews: some View {
        Value_ShowHideExample()
    }
}
