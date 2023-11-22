// 2/3/20.
import SwiftUI

private struct Curve_CheckYourUnderstanding2: View {
    @State private var change = false
    
    var body: some View {
        Text("Slow - Fast - Slow")
            .offset(y: change ? 300 : -300)
            .animation(.timingCurve(1, 0, 0, 1), value: change)
            .onTapGesture {
                change.toggle()
        }
    }
}

struct Curve_CheckYourUnderstanding2_Previews: PreviewProvider {
    static var previews: some View {
        Curve_CheckYourUnderstanding2()
    }
}
