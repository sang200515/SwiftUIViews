//
//  Title.swift
//  100Views
//
//9/27/19.
import SwiftUI

fileprivate struct Title: View {
    var body: some View {
        Text("Title") // Create text on the screen
            .font(.largeTitle) // Use a font modifier to make text larger
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
