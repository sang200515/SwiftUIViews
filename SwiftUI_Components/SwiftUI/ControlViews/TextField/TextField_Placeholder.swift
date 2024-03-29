//
//  TextField_Placeholder.swift
//  100Views
//
//6/28/19.
import SwiftUI

fileprivate struct TextField_Placeholder : View {
    @State private var textFieldData = ""
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)
            
            Text("Title Text (Placeholder or Hint)")
                .foregroundColor(.gray)
            
            Text("You can supply title text (placeholder/hint text) through the first parameter to let the user know the purpose of the text field.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.orange)
            
            Group {
                TextField("Here is title text", text: $textFieldData)
                    .textFieldStyle(.roundedBorder)
                
                TextField("User name", text: $username)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal)
        }.font(.title)
    }
}

struct TextField_Placeholder_Previews : PreviewProvider {
    static var previews: some View {
        TextField_Placeholder()
    }
}
