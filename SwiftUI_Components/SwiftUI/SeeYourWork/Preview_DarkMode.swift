//
//  Preview_DarkMode.swift
//  100Views
//
//9/27/19.
import SwiftUI

fileprivate struct Preview_DarkMode: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Previews").font(.largeTitle)
            Text("Dark Mode").foregroundColor(.gray)
            Text("By default, your preview will show in light mode. To see it in dark mode, you can use the environment modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
            
        }.font(.title)
    }
}

struct Preview_DarkMode_Previews: PreviewProvider {
    static var previews: some View {
        Preview_DarkMode()
            .preferredColorScheme(.dark)
    }
}
