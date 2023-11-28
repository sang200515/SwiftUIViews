//
//  ViewSizes_Pull_In.swift
//  100Views
//
//9/4/19.
import SwiftUI

fileprivate struct ViewSizes_Pull_In: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Layout Behavior").font(.largeTitle)
            Text("Views that Pull In").foregroundColor(.gray)
            Text("Some views minimize their frame size so it is only as big as the content within it.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.purple).foregroundColor(Color.white)
            
            Image(systemName: "arrow.down.to.line.alt")
            
            HStack { // Order views horizontally
                Image(systemName: "arrow.right.to.line.alt")
                Text("Text views pull in")
                Image(systemName: "arrow.left.to.line.alt")
            }
            
            Image(systemName: "arrow.up.to.line.alt")
            
            Text("Pull-In views tend to center themselves within their parent container view.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)
        }.font(.title)
    }
}

struct ViewSizes_Pull_In_Previews: PreviewProvider {
    static var previews: some View {
        ViewSizes_Pull_In()
    }
}
