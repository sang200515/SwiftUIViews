//
//  SecureField_Intro.swift
//  100Views
//
//6/23/19.
import SwiftUI

fileprivate struct SecureField_Intro : View {
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image("Logo")
                
            Spacer()
            
            Text("SecureField")
                .font(.largeTitle)
            
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("SecureFields, like TextFields, need to bind to a local variable.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.purple)
                .foregroundColor(Color.white)
            
            TextField("user name", text: $userName)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            SecureField("password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Spacer()
        }
    }
}

struct SecureField_Intro_Previews : PreviewProvider {
    static var previews: some View {
        SecureField_Intro()
    }
}
