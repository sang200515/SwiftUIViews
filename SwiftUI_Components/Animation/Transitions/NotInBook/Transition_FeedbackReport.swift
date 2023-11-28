
import SwiftUI

fileprivate struct Transition_FeedbackReport: View {
    @State private var change = false
    
    var body: some View {
        VStack {
            Button("Change") { change.toggle() }
            
            Text("This first transition uses an animation without a value param and will work.")
            
            if change {
                Image(systemName: "hare.fill")
                    .font(.largeTitle)
                    .transition(.slide)
//                    .animation(.default) // works
            }
            
            Spacer()
            
            Text("This second transition uses an animation WITH a value param and will NOT work.")
            
            if change {
                Image(systemName: "hare.fill")
                    .font(.largeTitle)
                    .transition(.slide)
                    .animation(.default, value: change) // does not work
            }
            
            Spacer()
        }
    }
}

struct Transition_FeedbackReport_Previews: PreviewProvider {
    static var previews: some View {
        Transition_FeedbackReport()
    }
}
