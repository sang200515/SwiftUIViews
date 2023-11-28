//
//2/22/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved
import SwiftUI

fileprivate struct ClipShape_WithLayers: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            Color.blue
                .ignoresSafeArea()
                .overlay(
                    RoundedRectangle(cornerRadius: 80)
                        .stroke(Color.clear, lineWidth: 4)
                        .shadow(radius: 3, x: 0, y: -4))
                .clipShape(RoundedRectangle(cornerRadius: 80))
                .frame(width: 500)
                .offset(x: 40, y: show ? -1000 : -100)
            
            Color.white
                .ignoresSafeArea()
                .overlay(
                    RoundedRectangle(cornerRadius: 80)
                        .stroke(Color.clear, lineWidth: 4)
                        .shadow(radius: 3, x: 0, y: -4))
                .clipShape(RoundedRectangle(cornerRadius: 80))
                .frame(width: 500)
                .offset(x: 40, y: show ? -1000 : -600)
            
            VStack {
                Spacer()
                
                Button(show ? "Close" : "Show") {
                    self.show.toggle()
                }.tint(.white)
            }
        }
        .animation(.default, value: show)
    }
}

struct ClipShape_WithLayers_Previews: PreviewProvider {
    static var previews: some View {
        ClipShape_WithLayers()
    }
}
