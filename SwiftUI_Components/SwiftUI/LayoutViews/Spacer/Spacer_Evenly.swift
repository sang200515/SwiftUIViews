//
//  Spacer_Evenly.swift
//  100Views
//
//9/4/19.
import SwiftUI

fileprivate struct Spacer_Evenly: View {
    var body: some View {
        VStack {
            Text("Spacer")
                .font(.largeTitle)
            
            Text("Evenly Spaced")
                .foregroundColor(.gray)
            
            Text("Use Spacer to evenly space views horizontally so they look good on any device.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
            Text("Before")
            HStack {
                VStack(alignment: .leading) {
                    Text("Names")
                        .font(.largeTitle)
                        .underline()
                    Text("Chase")
                    Text("Rodrigo")
                    Text("Mark")
                    Text("Evans")
                }
                VStack(alignment: .leading) {
                    Text("Color")
                        .font(.largeTitle)
                        .underline()
                    Text("Red")
                    Text("Orange")
                    Text("Green")
                    Text("Blue")
                }
            }
            Text("After")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
            
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Names")
                        .font(.largeTitle)
                        .underline()
                    Text("Chase")
                    Text("Rodrigo")
                    Text("Mark")
                    Text("Evans")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Color")
                        .font(.largeTitle)
                        .underline()
                    Text("Red")
                    Text("Orange")
                    Text("Green")
                    Text("Blue")
                }
                Spacer()
            }
            Spacer()
        }
        .font(.title)
        .minimumScaleFactor(0.8) // Allow text to resize on smaller devices
    }
}

struct Spacer_Evenly_Previews: PreviewProvider {
    static var previews: some View {
        Spacer_Evenly()
    }
}
