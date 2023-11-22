// 1/26/20.
import SwiftUI

private struct Curve_SetupTheBackground: View {
    private var backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color("Background4"), Color("Secondary4")]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient.ignoresSafeArea()
            
            VStack {
                Text("Workout Pro")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .padding(.top, 40)
                Spacer()
            }
        }
        .font(.title)
        .foregroundColor(Color("Foreground4"))
    }
}

struct Curve_SetupTheBackground_Previews: PreviewProvider {
    static var previews: some View {
        Curve_SetupTheBackground()
    }
}
