//
//  Description2.swift
//  100Views
//
//9/28/19.
import SwiftUI

fileprivate struct Description2: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Title")
                .font(.largeTitle)
            
            Text("Subtitle")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("Short description of what I am demonstrating goes here.")
                .frame(maxWidth: .infinity) // Extend until you can't go anymore
                .font(.title)
                .foregroundColor(Color.white)
                .background(Color.blue)
            //                .padding() // Add space all around this text
        }
    }
}

struct Description2_Previews: PreviewProvider {
    static var previews: some View {
        Description2()
    }
}
