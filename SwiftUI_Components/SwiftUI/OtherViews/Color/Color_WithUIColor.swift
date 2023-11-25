//
//  Color_WithUIColor.swift
//  100Views
//
//9/9/19.
import SwiftUI

private struct Color_WithUIColor: View {
    var body: some View {
        VStack(spacing: 5) {
            HeaderView("Color",
                       subtitle: "Using UIColor",
                       desc: "It should be mentioned that the Color view can also access colors from UIColor.")
            HStack {
                Text("SwiftUI")
                    .frame(maxWidth: .infinity)
                Text("UIColor")
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)

            
            SecondEightRows()
                .padding(.horizontal)
        }
        .font(.title)
    }
}

struct Color_WithUIColor_Previews: PreviewProvider {
    static var previews: some View {
        Color_WithUIColor()
    }
}

struct SecondEightRows: View {
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(UIColor.gray))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.red)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(UIColor.red))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(.green))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(.blue))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(.orange))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.yellow)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(.yellow))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.pink)
                RoundedRectangle(cornerRadius: 10)
                    .stroke()
                    .overlay(Text("(None)"))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.purple)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(.purple))
            }
        }
    }
}
