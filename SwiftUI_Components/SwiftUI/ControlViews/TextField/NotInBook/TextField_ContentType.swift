//
//  TextField_ContentType.swift
//  100Views
//
//6/29/19.
import SwiftUI

fileprivate struct TextField_ContentType : View {
    @State private var textFieldData = ""

    // TODO: Include this in the book when we can get suggestions to show up in Simulator.
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)
            Text("Content Type")
                .font(.title)
                .foregroundColor(.gray)
            Divider()
            TextField("City", text: $textFieldData)
                .textFieldStyle(.roundedBorder)
                .textContentType(.addressCity) // How to get city suggestions to show
                .padding(.horizontal)
        }
    }
}

struct TextField_ContentType_Previews : PreviewProvider {
    static var previews: some View {
        TextField_ContentType()
    }
}
