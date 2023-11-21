//
//  BasicSyntax.swift
//  100Views
//
//  Created by Mark Moeykens on 7/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

private struct BasicSyntax: View {
    var body: some View {
        get {
            return Text("Hello World!") // Adds a text view to the screen
        }
    }
}

struct Person {
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
