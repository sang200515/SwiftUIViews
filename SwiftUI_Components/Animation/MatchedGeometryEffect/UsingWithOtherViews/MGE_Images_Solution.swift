import SwiftUI

private struct MGE_Images_Solution: View {
    @State private var zoom = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Images - Solution")
            BannerText("Move the border ABOVE the matchedGeometryEffect so it is included when the view is resized/repositioned.", backColor: .green)
            
            Spacer()
            
            if zoom {
                Image("profile.female")
                    .resizable()
                    .scaledToFit()
                    .border(Color.green, width: 2)
                    .matchedGeometryEffect(id: "customerProfile", in: namespace)
                    .onTapGesture { zoom.toggle() }
            } else {
                Image("profile.female")
                    .resizable()
                    .scaledToFit()
                    .border(Color.green, width: 2)
                    .matchedGeometryEffect(id: "customerProfile", in: namespace)
                    .frame(height: 50)
                    .onTapGesture { zoom.toggle() }
            }
            
            Spacer()
        }
        .font(.title)
        .animation(.linear, value: zoom)
        .padding(.bottom)
    }
}

struct MGE_Images_Solution_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Images_Solution()
    }
}
