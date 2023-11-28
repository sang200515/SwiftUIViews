//
//  Popup_EndResult.swift
//  SwiftUIAnimations
//
// 11/9/19.
import SwiftUI

fileprivate struct Popup_EndResult: View {
    @State private var showPopup = true
    @GestureState private var popupOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                TitleText("Triggers")
                SubtitleText("Show Popup")
                BannerText("The popup will animate when shown and animate will disappears.", backColor: .yellow)
                
                Spacer()
                
                Button("Show Popup") {
                    showPopup = true
                }
            }
            .blur(radius: showPopup ? 2 : 0) // Blur the background when popup is showing
            .font(.title)
            .animation(.easeOut, value: showPopup)
            
            if showPopup {
                // The popup
                ZStack {
                    Color.black
                        .opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture { showPopup = false }
                    
                    VStack(spacing: 20) {
                        Text("Drag popup off the screen")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                        Spacer()
                        Text("You can also tap outside of the popup to close")
                        Spacer()
                        Button("Or Tap This Button to Close") {
                            showPopup = false
                        }.padding(.bottom)
                    }
                    .frame(height: 300)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .padding(.horizontal, 25)
                    .offset(popupOffset)
                    .gesture(
                        DragGesture(minimumDistance: 100) // They have to drag it over 100 points
                            .updating($popupOffset, body: { (value, popupOffset, transaction) in
                                popupOffset = value.translation
                            })
                            .onEnded({ value in
                                // If they dragged the popup over 100 points then just close the popup
                                showPopup = false
                            }))
                }
                .animation(.default, value: showPopup)
            }
        }
        .animation(.easeIn, value: showPopup)
    }
}

struct Popup_EndResult_Previews: PreviewProvider {
    static var previews: some View {
        Popup_EndResult()
    }
}
