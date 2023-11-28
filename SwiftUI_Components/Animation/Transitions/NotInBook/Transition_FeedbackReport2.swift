// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

fileprivate struct Transition_FeedbackReport2: View {
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            Button("Show") {
                withAnimation {
                    showDetail.toggle()
                }
            }
            .padding()
            
            if showDetail {
                Text("Show this detail.")
                    .transition(.offset(x: 40, y: 40)) // Does not move when shown without preview workaround
//                    .transition(.scale(scale: 0.5)) // Does not scale when shown without preview workaround
//                    .transition(.slide) // Does not slide in without preview workaround
//                    .transition(.opacity) // Does not fade in without preview workaround
//                    .transition(.move(edge: .leading)) // Does not slide in without preview workaround
            }
            
            Spacer()
        }
        .font(.title)
    }
}

struct Transition_FeedbackReport2_Previews: PreviewProvider {
    static var previews: some View {
        // Adding a VStack fixes the preview so the transition looks correct:
        VStack {
            Transition_FeedbackReport2()
        }
    }
}
