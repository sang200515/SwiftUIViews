//
//  Text_TruncationMode.swift
//  100Views
//
//6/27/19.
import SwiftUI

private struct Text_TruncationMode : View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Text").font(.largeTitle)
            Text("Truncation Mode").font(.title).foregroundColor(.gray)
            Image("TruncationMode")
            Text("When text gets truncated, you can control where the ellipsis (...) shows.")
                .frame(maxWidth: .infinity).padding()
                .foregroundColor(.white).background(Color.green)
                .font(.title)
                .minimumScaleFactor(0.5)
            Text("Default: .truncationMode(.tail)")
                .frame(maxWidth: .infinity).padding()
                .foregroundColor(.white).background(Color.green)
                .font(.title)
            // Text automatically defaults at end
            Text("This will be the best day of your life!")
                .padding(.horizontal)
                .lineLimit(1)
            Text(".truncationMode(.middle)")
                .frame(maxWidth: .infinity).padding()
                .foregroundColor(.white).background(Color.green)
            Text("This will be the best day of your life!")
                .truncationMode(.middle) // Truncate in middle
                .padding(.horizontal)
                .lineLimit(1)
            Text(".truncationMode(.head)")
                .frame(maxWidth: .infinity).padding()
                .foregroundColor(.white).background(Color.green)
            Text("This will be the best day of your life!")
                .truncationMode(.head) // Truncate at beginning
                .padding(.horizontal)
                .lineLimit(1)
        }
        .font(.title)
    }
}

struct Text_TruncationMode_Previews : PreviewProvider {
    static var previews: some View {
        Text_TruncationMode()
    }
}
