//
//  Scope_SequenceOnSingleView.swift
//  SwiftUIAnimations
//
// 11/21/19.
import SwiftUI

private struct Scope_SequenceOnSingleView: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Scope")
            SubtitleText("Sequence on Single View")
            BannerText("Earlier, you learned how to use delay to sequence animations. You can also sequence multiple animations on a single view.", backColor: .yellow, textColor: .black)
            
            Button("Change") {
                change.toggle()
            }
            Spacer()
            
            Image(systemName: "heart.fill")
                .foregroundColor(Color.yellow)
                .font(.system(size: 150))
                
                // First set of animated changes
                .scaleEffect(change ? 2 : 1)
                .animation(Animation.easeInOut(duration: 1), value: change)
                
                // Second set of animated changes
                .scaleEffect(change ? 0.75 : 1)
                .animation(Animation.easeIn.delay(1), value: change) // Notice the delay
            
            Spacer()
        }
        .font(.title)
    }
}

struct Scope_SequenceOnSingleView_Previews: PreviewProvider {
    static var previews: some View {
        Scope_SequenceOnSingleView()
    }
}
