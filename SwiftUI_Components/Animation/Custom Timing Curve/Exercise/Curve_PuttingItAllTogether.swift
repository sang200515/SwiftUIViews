// 1/26/20.
import SwiftUI

fileprivate struct Curve_PuttingItAllTogether: View {
    @State private var showMenus = false
    private var backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color("Background4"), Color("Secondary4")]),
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient.ignoresSafeArea()
            
            TitleView2()
            
            MenuViews(showMenus: $showMenus)
            
            WelcomeBackView(showMenus: $showMenus)
        }
        .font(.title)
        .foregroundColor(Color("Foreground4"))
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                showMenus.toggle()
            }
        }
    }
}

struct Curve_PuttingItAllTogether_Previews: PreviewProvider {
    static var previews: some View {
        Curve_PuttingItAllTogether()
    }
}
