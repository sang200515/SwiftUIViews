//
//  BasicAnimations_Challenge2.swift
//  SwiftUIAnimations
//
// 10/27/19.
import SwiftUI

private struct BasicAnimations_Challenge1: View {
    @State private var show = false
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color("ColorBackground")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("Challenge")
                SubtitleText("Show Login")
                Spacer()
                Text("Already have an account?")
                Button("Login Now") {
                    show.toggle()
                }.font(.body)
                
                VStack(spacing: 20) {
                    Image(systemName: "lock.shield")
                    TextField("Username", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                .animation(.default, value: show)
                .offset(x: show ? 0 : -500)
                
                Spacer()
                Spacer()
                
            }
            .font(.title)
        }
    }
}

struct BasicAnimations_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_Challenge1()
    }
}
