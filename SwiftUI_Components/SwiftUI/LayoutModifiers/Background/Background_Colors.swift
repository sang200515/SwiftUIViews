//8/23/19.
import SwiftUI

private struct Background_Colors: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Background").font(.largeTitle)
            Text("Colors").foregroundColor(.gray)
            Text("The background modifier is commonly used to set colors behind controls. This Text view has Color.yellow set as the background.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
            
            Text("Background colors on shapes")
            Circle()
                .frame(width: 132, height: 44)
                .background(Color.yellow)
            
            Text("Background colors on controls")
            Button(action: {}) {
                Text("Button")
            }
            .padding()
            .background(Color.yellow)
            
            Text("Background colors on layout views")
            HStack() {
                Text("This is in an HStack")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Background_Colors_Previews: PreviewProvider {
    static var previews: some View {
        Background_Colors()
    }
}
