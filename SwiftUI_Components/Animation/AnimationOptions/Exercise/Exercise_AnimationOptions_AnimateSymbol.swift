//
//  Exercise_AnimationOptions_AnimateSymbol.swift
//  SwiftUIAnimations
//
// 11/27/19.
import SwiftUI

fileprivate struct Exercise_AnimationOptions_AnimateSymbol: View {
    @State private var showLogin = false
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
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
                        .scaleEffect(showLogin ? 1 : 4) // Start large, go smaller
                        .animation(.easeIn(duration: 0.5).delay(0.5), value: showLogin)
                    TextField("Username", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Login", action: { })
                        .foregroundColor(Color("Accent"))
                }
                .padding(.horizontal)
                .onAppear {
                    showLogin = true
                }
                
                Spacer()
                Spacer()
            }
            .padding(.top)
            .font(.title)
        }
    }
}

struct Exercise_AnimationOptions_AnimateSymbol_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_AnimationOptions_AnimateSymbol()
    }
}
