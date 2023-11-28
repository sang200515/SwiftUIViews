//
//  Exercise_AnimationOptions_TriggerAnimation.swift
//  SwiftUIAnimations
//
// 11/27/19.
import SwiftUI

fileprivate struct Exercise_AnimationOptions_TriggerAnimation: View {
    @State private var showLogin = false
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            // Background
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
                        .font(.system(size: 70)) // Make symbol bigger
                        .padding()
                        .foregroundColor(Color("Gold"))
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

struct Exercise_AnimationOptions_TriggerAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_AnimationOptions_TriggerAnimation()
    }
}
