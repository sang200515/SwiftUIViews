//9/21/19.
import SwiftUI

fileprivate struct Navigation_BarHidden: View {
    @State private var isHidden = false
    
    var body: some View {
        NavigationStack {
            /*
             Text("If you don't want to show a navigation bar, you can use the navigationBarHidden modifier to hide it.")
             */
            Toggle("Hide Nav Bar", isOn: $isHidden)
                .font(.title)
                .padding()
                .navigationBarHidden(isHidden)
                .navigationTitle("Hide Me")
        }
    }
}

struct Navigation_BarHidden_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_BarHidden()
    }
}
