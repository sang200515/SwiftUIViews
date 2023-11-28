//
//  Text_ImportedFont.swift
//  100Views
//
//9/5/19.
import SwiftUI

fileprivate struct Text_ImportedFont: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            
            Text("Imported Fonts")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("Use the Font.custom() function to set imported fonts you added to your project.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .font(.title)
            
            Text("Hello, World!")
                // Specify the name and size of the font to use
                // (Note: You can remove "Font" and it'll still work)
                .font(Font.custom("Nightcall", size: 60))
                .padding(.top)
        }
    }
}

struct Text_ImportedFont_Previews: PreviewProvider {
    static var previews: some View {
        Text_ImportedFont()
    }
}
