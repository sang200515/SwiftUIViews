//
//  FunctionBuilders.swift
//  100Views
//
//8/7/19.
import SwiftUI

private struct FunctionBuilders: View {
    // Missing code here
    var body: some View {
        VStack(content: {
            Text("Hello World!")
            Text("This Vertical Stack is using a function builder")
        })
    }
}

#if DEBUG
struct FunctionBuilders_Previews: PreviewProvider {
    static var previews: some View {
        FunctionBuilders()
    }
}
#endif
