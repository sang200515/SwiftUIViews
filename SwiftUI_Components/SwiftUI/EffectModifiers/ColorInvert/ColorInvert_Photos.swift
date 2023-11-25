import SwiftUI

private struct ColorInvert_Photos: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color Invert").font(.largeTitle)
            Text("With Photos").font(.title).foregroundColor(.gray)
            Text("You can use color invert on photos. It works the same way with individual colors.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.green)
                .foregroundColor(.white)
            
            HStack {
                Spacer()
                Text("Original Photo")
                Spacer()
                Text("Inverted Photo")
                Spacer()
            }
            
            HStack {
                Image("yosemite")
                Image("yosemite").colorInvert()
            }
            HStack {
                Image("rainbow").resizable().frame(width: 200)
                Image("rainbow").resizable().frame(width: 200).colorInvert()
            }
            HStack {
                Image("valley").resizable().frame(width: 200)
                Image("valley").resizable().frame(width: 200).colorInvert()
            }
            HStack {
                Image("sunset").resizable().frame(width: 200)
                Image("sunset").resizable().frame(width: 200).colorInvert()
            }
        }
        .minimumScaleFactor(0.5)
    }
}

struct ColorInvert_Photos_Previews: PreviewProvider {
    static var previews: some View {
        ColorInvert_Photos()
    }
}
