

import SwiftUI

private struct List_HeaderProminence: View {
    var body: some View {
        List {
            Section {
                Text("You can also use header prominence to style the header.")
                    .listRowBackground(Color.green)
            } header: {
                Text("Standard Header Prominence")
            }
            .headerProminence(.standard)
            
            Section {
                Text("Use increased header prominence to make it stand out more.")
                    .listRowBackground(Color.green)
            } header: {
                Text("Increased Header Prominence")
            }
            .headerProminence(.increased)
        }
        .font(.title)
    }
}

struct List_HeaderProminence_Previews: PreviewProvider {
    static var previews: some View {
        List_HeaderProminence()
            .preferredColorScheme(.dark)
    }
}
