//
//  TextField_KeyboardType.swift
//  SwiftUI_Views
//
//11/17/19.
import SwiftUI

fileprivate struct TextField_KeyboardType: View {
    @State private var textFieldData = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)
            Text("Keyboard Types")
                .foregroundColor(.gray)
            
            Image("KeyboardType")
            
            Text("Control which keyboard is shown with the keyboardType modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
            
            TextField("Enter Phone Number", text: $textFieldData)
                .keyboardType(UIKeyboardType.phonePad) // Show keyboard for phone numbers
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Spacer()
        }.font(.title)
    }
}

struct TextField_KeyboardType_Previews: PreviewProvider {
    static var previews: some View {
        TextField_KeyboardType()
    }
}
