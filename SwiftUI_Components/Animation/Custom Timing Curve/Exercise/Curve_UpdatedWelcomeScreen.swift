// 1/26/20.
import SwiftUI

private struct Curve_UpdatedWelcomeScreen: View {
        private var backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color("Background4"), Color("Secondary4")]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient.ignoresSafeArea()
            
            TitleView2()
            
//            WelcomeBackView()
        }
        .font(.title)
        .foregroundColor(Color("Foreground4"))
    }
}

struct Curve_UpdatedWelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        Curve_UpdatedWelcomeScreen()
    }
}
