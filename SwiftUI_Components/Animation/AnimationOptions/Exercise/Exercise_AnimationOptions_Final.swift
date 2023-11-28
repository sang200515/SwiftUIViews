//
//  Exercise_AnimationOptions_Final.swift
//  SwiftUIAnimations
//
// 11/24/19.
import SwiftUI

fileprivate struct Exercise_AnimationOptions_Final: View {
    @State private var showLogin = false
    @State private var userName = ""
    @State private var password = ""
    
    let xOffset: CGFloat = -200
    let showLoginDuration: Double = 0.7
    let delay = 0.5
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Exercise").foregroundColor(Color("Gold"))
                    .font(Font.custom("DIN Condensed Bold", size: 70))
                Text("Show Login").foregroundColor(.gray)
                Spacer()
                VStack(spacing: 30) {
                    Image(systemName: "lock.shield")
                        .font(.system(size: 70))
                        .padding()
                        .foregroundColor(Color("Gold"))
                        .scaleEffect(showLogin ? 1 : 4)
                        .animation(.easeIn(duration: showLoginDuration/2).delay(delay), value: showLogin)
                    TextField("Username", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(x: showLogin ? 0 : xOffset)
                        .opacity(showLogin ? 1 : 0)
                        .animation(.easeOut(duration: showLoginDuration).delay(delay+0.2), value: showLogin)
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(x: showLogin ? 0 : xOffset)
                        .opacity(showLogin ? 1 : 0)
                        .animation(.easeOut(duration: showLoginDuration).delay(delay+0.4), value: showLogin)
                    Button("Login", action: { }).foregroundColor(Color("Accent"))
                        .offset(x: showLogin ? 0 : xOffset)
                        .opacity(showLogin ? 1 : 0)
                        .animation(.easeOut(duration: showLoginDuration).delay(delay+0.6), value: showLogin)
                }
                .padding(.horizontal)
                .onAppear {
                    showLogin = true
                }
                
                Spacer()
                Spacer()
            }.font(.title)
        }
    }
}

struct Exercise_AnimationOptions_Final_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_AnimationOptions_Final()
    }
}
