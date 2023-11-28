//
//  Previews_Intro.swift
//  100Views
//
//9/26/19.
import SwiftUI

fileprivate struct Previews_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Previews")
                .font(.largeTitle)
            
            Text("Introduction")
                .foregroundColor(.gray)
            
            Text("Xcode looks for a struct that conforms to the PreviewProvider protocol and accesses its previews property to display a view on the Canvas.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
            
        }.font(.title)
    }
}

// Xcode looks for PreviewProvider struct
struct Previews_Intro_Previews: PreviewProvider {
    // It will access this property to get a view to show in the Canvas (if the Canvas is shown)
    static var previews: some View {
        // Instantiate and return your view inside this property to see a preview of it
        Previews_Intro()
    }
}
