import SwiftUI

fileprivate struct ColorInvert_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Color Invert").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("Use color invert to change a color to the opposite color on the color wheel.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.green)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Image("Invert")
            
            HStack {
                Spacer()
                Text("Original Color")
                Spacer()
                Text("Inverted Color")
                Spacer()
            }
            
            Group {
                HStack {
                    Color.red
                    Color.red.colorInvert()
                }
                HStack {
                    Color.orange
                    Color.orange.colorInvert()
                }
                HStack {
                    Color.yellow
                    Color.yellow.colorInvert()
                }
                HStack {
                    Color.green
                    Color.green.colorInvert()
                }
                HStack {
                    Color.blue
                    Color.blue.colorInvert()
                }
                HStack {
                    Color.purple
                    Color.purple.colorInvert()
                }
                HStack {
                    Color.pink
                    Color.pink.colorInvert()
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ColorInvert_Intro()
}
