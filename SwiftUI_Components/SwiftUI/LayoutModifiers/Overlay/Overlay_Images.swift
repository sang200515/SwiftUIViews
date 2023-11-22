import SwiftUI

private struct Overlay_Images: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Overlay", subtitle: "Over Images with Alignment",
                       desc: "Overlays are great when showing text over images.",
                       back: .blue, textColor: .white)
            
            Image("canyonlands")
                .resizable()
                .overlay(Rectangle()
                    .frame(height: 80)
                    .opacity(0.5), alignment: .bottom)
                .overlay(Text("Canyonlands")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.bottom), alignment: .bottom)
        }
        .font(.title)
    }
}

struct Overlay_Images_Previews: PreviewProvider {
    static var previews: some View {
        Overlay_Images()
    }
}
