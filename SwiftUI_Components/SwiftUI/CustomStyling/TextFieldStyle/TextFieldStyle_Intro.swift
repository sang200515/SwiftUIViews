//
//  TextFieldStyle_Intro.swift
//  100Views
//
//9/12/19.
import SwiftUI

fileprivate struct TextFieldStyle_Intro: View {
    @State private var textFieldData = ""
    var body: some View {
        VStack(spacing: 15) {
            Text("Text Field Style").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("You can start with a plain looking text field style (automatic) and modify it. Or you can go with the rounded border style.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.pink)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Group {
                Text("automatic").font(.title)
                TextField("automatic", text: $textFieldData)
                    .textFieldStyle(.automatic)
                
                Text("plain").font(.title)
                TextField("plain", text: $textFieldData)
                    .textFieldStyle(.plain)
                
                Text("roundedBorder").font(.title)
                TextField("roundedBorder", text: $textFieldData)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TextFieldStyle_Intro()
}
