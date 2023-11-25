//
//  BasicSyntax.swift
//  100Views
//
//7/25/19.
import SwiftUI

private struct BasicSyntax: View {
    var body: some View {
        get {
            return Text("Hello World!") // Adds a text view to the screen
        }
    }
}

struct Person2 {
    // Computed read-only property (no setter, value is not stored)
    var personType: String {
        get {
            return "human"
        }
    }
}

struct BasicSyntax_Previews: PreviewProvider {
    static var previews: some View {
        BasicSyntax()
    }
}
