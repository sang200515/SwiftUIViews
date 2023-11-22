
import SwiftUI

private struct Example_NoAnimation: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Example")
            SubtitleText("Parts of Animation")
            BannerText("The button changes a variable that then changes a view's property. That property change causes a change on the screen.")
            
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                // 2. The variable's value changing causes the views Y position to change
                .offset(x: 0, y: change ? 300 : 0)
            
            Spacer()
            
            Button("Change") {
                // 1. The button triggers a variable's value to change
                change.toggle()
            }.padding(.bottom)
        }.font(.title)
    }
}

struct Example_NoAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Example_NoAnimation()
    }
}
