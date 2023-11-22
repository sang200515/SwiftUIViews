// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

private struct Combining_Feedback: View {
    @State private var change1 = false
    @State private var change2 = false
    @State private var change3 = false
    @State private var change4 = false

    
    var body: some View {
        VStack {
            Text("Expecting: Slide & Fade In & Out")
            
            VStack {
                // Using withAnimation
                // Not working in Preview (does not slide in)
                // Works on Simulator
                // Works on device
                Button("Change") {
                    withAnimation {
                        change1.toggle()
                    }
                }
                
                if change1 {
                    Text("Slide & Fade In & Out")
                        .transition(AnyTransition.slide.combined(with: .opacity))
                }
                
                Spacer()
            }
            
            VStack {
                // Using animation modifier
                // Not working in Preview
                // Not working on Simulator
                // Not working on device
                Button("Change") {
                    change2.toggle()
                }
                
                if change2 {
                    Text("Slide & Fade In & Out")
                        .transition(AnyTransition.slide.combined(with: .opacity))
                        .animation(.default, value: change2)
                }
                
                Spacer()
            }
            
            VStack {
                // Using attached animation to transition
                // Not working in Preview (choppy exit animation)
                // Not working on Simulator (choppy exit animation)
                // Not working on device (choppy exit animation)
                Button("Change") {
                    change3.toggle()
                }
                
                if change3 {
                    Text("Slide & Fade In & Out")
                        .transition(AnyTransition.slide.combined(with: .opacity).animation(.default))
                }
                
                Spacer()
            }
            
            // Using animation on Parent view
            // Using animation modifier
            // Works in Preview
            // Works on Simulator
            // Works on device
            VStack {
                Button("Change") {
                    change4.toggle()
                }
                
                if change4 {
                    Text("Slide & Fade In & Out")
                        .transition(AnyTransition.slide.combined(with: .opacity))
                }
                
                Spacer()
            }
            .animation(.default, value: change4)
        }
        .font(.title)
    }
}

struct Combining_Feedback_Previews: PreviewProvider {
    static var previews: some View {
        Combining_Feedback()
    }
}
