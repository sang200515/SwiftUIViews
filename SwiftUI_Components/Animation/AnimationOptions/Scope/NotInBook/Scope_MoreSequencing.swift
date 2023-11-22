//
//  Scope_MoreSequencing.swift
//  SwiftUIAnimations
//
// 11/23/19.
import SwiftUI

private struct Scope_MoreSequencing: View {
    @State private var change = false
    @State private var changeOrder = false
    
    var body: some View {
        VStack(spacing: 10) {
            TitleText("With Animation")
            SubtitleText("Sequencing")
            BannerText("Even though the zIndex modifier is a number, it cannot be animated when changed. But here is a way to use withAnimation sequencing to animate the zIndex change. (Doesn't work)", backColor: .yellow, textColor: .black)
                .fixedSize(horizontal: false, vertical: true)
            
            Button("Change") {
                withAnimation(Animation.easeOut(duration: 1)) {
                    change = true
                }
                withAnimation(Animation.default.delay(1)) {
                    changeOrder.toggle()
                     change = false
                }
            }
            
            Spacer()
            
            Image(systemName: "eurosign.circle")
                .font(.system(size: 80))
                .padding(30)
                .background(Circle().fill(Color.yellow).shadow(radius: 4))
                .offset(x: change ? -80 : -35)
                .zIndex(changeOrder ? 1 : 0)
            
            Image(systemName: "sterlingsign.circle")
                .font(.system(size: 80))
                .padding(30)
                .background(Circle().fill(Color.yellow).shadow(radius: 4))
                .offset(x: change ? 80 : 50, y: -170)
        }
        .font(.title)
    }
}

struct Scope_MoreSequencing_Previews: PreviewProvider {
    static var previews: some View {
        Scope_MoreSequencing()
    }
}
