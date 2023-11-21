// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI

private struct Label_Colors: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Colors",
                       subtitle: "ForegroundColor",
                       desc: "Use foregroundColor to change the icon and text.",
                       back: .pink)

            Label("Camera Settings", systemImage: "camera.badge.ellipsis")
                .foregroundColor(.pink)
            
            
            DescView(desc: "Divide up the text and icon so you can format them differently.", back: .pink)
            Label {
                Text("Camera Settings")
                    .foregroundColor(.purple)
            } icon: {
                Image(systemName: "camera.badge.ellipsis")
                    .foregroundColor(.pink)
            }
        }
        .font(.title)
    }
}

struct Label_Colors_Previews: PreviewProvider {
    static var previews: some View {
        Label_Colors()
    }
}
