//  Created by Mark Moeykens on 6/19/19.
import SwiftUI

private struct Navigation_Intro : View {
    var body: some View {
        NavigationStack {
            Image(systemName: "hand.wave.fill")
                .font(.largeTitle)
        }
    }
}


struct Navigation_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Navigation_Intro()
    }
}
