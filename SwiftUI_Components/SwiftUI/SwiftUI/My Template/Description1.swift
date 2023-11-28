//
//  Description.swift
//  100Views
//
//9/28/19.
import SwiftUI

fileprivate struct Description1: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Title")
                .font(.largeTitle)
            
            Text("Subtitle")
                .font(.title)
                .foregroundColor(.gray)
            
             Text("Short description of what I am demonstrating goes here.")
                .font(.title)
                .foregroundColor(Color.white)
                .background(Color.blue) // Add the color blue behind the text.
        }
    }
}

struct Description1_Previews: PreviewProvider {
    static var previews: some View {
        Description1()
    }
}
