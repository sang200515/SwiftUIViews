// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI

private struct Toolbar_ToolbarItemGroup: View {
    var body: some View {
        NavigationStack {
            VStack {

            }
            .font(.title)
            .navigationTitle("Toolbar")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "aspectratio")
                    }
                    Button(action: {}) {
                        Image(systemName: "gearshape.fill")
                    }
                }
            }
            .tint(.green)
        }
    }
}

struct Toolbar_ToolbarItemGroup_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar_ToolbarItemGroup()
            .preferredColorScheme(.dark)
    }
}
