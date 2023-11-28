import SwiftUI

fileprivate struct Navigation_NavigationTitle: View {
    var body: some View {
        NavigationStack {
            Text("😃")
            // BOOK NOTE: This creates a large title in your nav bar
                .navigationTitle("Navigation Stack Title")
        }
        .font(.title)
    }
}

struct Navigation_NavigationTitle_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_NavigationTitle()
    }
}
