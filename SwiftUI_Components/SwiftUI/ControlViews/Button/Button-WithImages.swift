//9/1/19.
import SwiftUI

fileprivate struct Button_WithPhotos: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Button")
                .font(.largeTitle)
            
            Button(action: {}) {
                Image("yosemite")
            }
            
            Button(action: {}) {
                Image("yosemite")
                    .renderingMode(.original)
                    .cornerRadius(40)
            }
            
            Button(action: {}) {
                Image("yosemite")
                    .renderingMode(.template)
                    .cornerRadius(40)
            }
        }
        .font(.title)
    }
}

struct Button_BitmapImages_Previews: PreviewProvider {
    static var previews: some View {
        Button_WithPhotos()
    }
}
