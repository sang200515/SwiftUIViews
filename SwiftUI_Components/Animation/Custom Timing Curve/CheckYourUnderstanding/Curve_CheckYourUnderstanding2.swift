// 2/3/20.
import SwiftUI

private struct Curve_CheckYourUnderstanding2: View {
    @State private var change = false
    
    var body: some View {
        Text("Slow - Fast - Slow")
            .offset(y: change ? 200 : -200)
            .animation(.timingCurve(1, 0, 0, 1), value: change)
            .onTapGesture {
                change.toggle()
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    change.toggle()
                }
            }
    }
}

struct Curve_CheckYourUnderstanding2_Previews: PreviewProvider {
    static var previews: some View {
        Curve_CheckYourUnderstanding2()
    }
}
