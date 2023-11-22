//  Copyright © 2019 Mark Moeykens. All rights reserved

import SwiftUI

private struct Animate_TextSize: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Text Size")
            BannerText("You can also animate text size.",
                       backColor: .blue, textColor: .white)
            
            Button("Change") {
                change.toggle()
            }
            
            Spacer()
            
            Text("Hello!")
                .font(.system(size: change ? 150 : 20))
                .animation(.easeInOut, value: change)
            
            Spacer()
        }
        .font(.title)
    }
}

struct Animate_TextSize_Previews: PreviewProvider {
    static var previews: some View {
        Animate_TextSize()
    }
}
