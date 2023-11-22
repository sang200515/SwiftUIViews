

import SwiftUI

private struct List_Badge: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("List",
                       subtitle: "Badge",
                       desc: "Using badge on list rows will add a number to the end of the row.")
            
            Label("Count", systemImage: "number.circle")
                .badge(5)
            
            List {
                Text("Row 0")
                    .badge(0)
                Text("Row 1")
                    .badge(1)
                    .foregroundColor(.red)
                Text("Row 2")
                    .badge(2)
                Text("Row 3")
                    .badge(3)
                    .font(.title3.weight(.bold))
                Text("Row 4")
                    .badge(4)
            }
        }
        .font(.title)
    }
}

struct List_Badge_Previews: PreviewProvider {
    static var previews: some View {
        List_Badge()
    }
}
