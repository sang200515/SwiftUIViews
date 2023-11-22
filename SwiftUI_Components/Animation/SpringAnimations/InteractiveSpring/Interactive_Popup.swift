//
//  Interactive_Popup.swift
//  SwiftUIAnimations
//
// 12/11/19.
import SwiftUI

private struct Interactive_Popup: View {
    @State private var showPopup = false
    @State private var animate = true // Used to animate only when popup is shown
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("Interactive Spring").foregroundColor(Color("Gold"))
                SubtitleText("Show Popup")
                BannerText("The popup will bounce when shown and disappear with no animation.", backColor: Color("Gold"))
                
                Spacer()
                
                Button("Show Popup") {
                    animate.toggle()
                    showPopup = true
                }
            }
            .font(.title)
            .blur(radius: showPopup ? 2 : 0)
            .animation(.easeOut, value: showPopup)
            
            ZStack {
                // Background behind popup
                Color.black
                    .opacity(0.4)
                    .ignoresSafeArea()
                    .animation(.none, value: showPopup)
                
                VStack {
                    Circle()
                        .fill(Color("Gold"))
                        .frame(width: 70, height: 70)
                        .overlay(
                            Image(systemName: "questionmark.circle")
                                .font(.system(size: 50))
                                .foregroundColor(.white))
                        .offset(y: 40)
                        .zIndex(1)
                    VStack {
                        Color("Gold")
                            .frame(height: 40)
                        Spacer()
                        Text("Animate the appearance of this popup!")
                        Spacer()
                        Button("Close") {
                            showPopup = false
                        }
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color("Gold"))
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                }
                .frame(height: 300)
                .background(Color.clear)
                .padding(.horizontal, 25)
                .scaleEffect(x: showPopup ? 1 : 0.8,
                             y: showPopup ? 1 : 1.3)
                .animation(.spring(response: 0.2, dampingFraction: 0.5), value: animate)
            }
            .opacity(showPopup ? 1 : 0)
        }
        .tint(Color("Accent"))
    }
}

struct Interactive_Popup_Previews: PreviewProvider {
    static var previews: some View {
        Interactive_Popup()
    }
}
