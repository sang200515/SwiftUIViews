//
//  ZStack_1_00.swift
//  100Views
//
//6/15/19.
import SwiftUI

fileprivate struct ZStack_1_00 : View {
    var body: some View {
        ZStack {
            // LAYER 1: Furthest back
            Color.gray // Yes, Color is a view!
            
            // LAYER 2: This VStack is on top.
            VStack(spacing: 20) {
                Text("ZStack")
                    .font(.largeTitle)
                
                Text("Introduction")
                    .foregroundColor(.white)
                
                Text("ZStacks are great for setting a background color.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                
                Text("But notice the Color stops at the Safe Areas (white areas on top and bottom).")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
            }
            .font(.title)
        }
    }
}

struct ZStack_1_00_Previews : PreviewProvider {
    static var previews: some View {
        ZStack_1_00()
    }
}
