//  Created by Mark Moeykens on 8/25/19.
import SwiftUI

private struct Color_Inverting: View {
    var body: some View {
        VStack(spacing: 5) {
            HeaderView("Color",
                       subtitle: "Inverting",
                       desc: "Using the colorInvert modifier you can increase your choices from the system color pallet.")
                .font(.title)
                .layoutPriority(1)
            
            HStack {
                Text("System")
                    .frame(maxWidth: .infinity)
                Text("Inverted")
                    .frame(maxWidth: .infinity)
            }
            .font(.title)
            
            Group {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                        .overlay(Text("Gray").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.red)
                        .overlay(Text("Red").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.red)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.green)
                        .overlay(Text("Green").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.green)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue)
                        .overlay(Text("Blue").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.orange)
                        .overlay(Text("Orange").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.orange)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.yellow)
                        .overlay(Text("Yellow").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.yellow)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.pink)
                        .overlay(Text("Pink").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.pink)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.purple)
                        .overlay(Text("Purple").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.purple)
                        .colorInvert()
                }
            }.padding(.horizontal)
        }
    }
}

struct Color_Inverting_Previews: PreviewProvider {
    static var previews: some View {
        Color_Inverting()
    }
}
