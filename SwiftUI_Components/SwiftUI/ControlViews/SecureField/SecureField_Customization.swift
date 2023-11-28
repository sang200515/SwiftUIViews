//
//  SecureField_Customization.swift
//  100Views
//
//6/23/19.
import SwiftUI

fileprivate struct SecureField_Customization : View {
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("SecureField")
                .font(.largeTitle)
            Text("Customization")
                .font(.title)
                .foregroundColor(.gray)
            Text("Use a ZStack to put a RoundedRectangle behind a SecureField with a plain textfieldStyle.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.purple)
                .foregroundColor(Color.white)
            
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.purple)
                TextField("user name", text: $userName)
                    .foregroundColor(Color.white)
                    .padding(.horizontal)
            }
            .frame(height: 40)
            .padding(.horizontal)
            
            Text("Or overlay the SecureField on top of another view or shape.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.purple)
                .foregroundColor(Color.white)
            
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.purple)
                .overlay(
                    SecureField("password", text: $password)
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
            )
                .frame(height: 40)
                .padding(.horizontal)
        }
    }
}

struct SecureField_Customization_Previews : PreviewProvider {
    static var previews: some View {
        SecureField_Customization()
    }
}
