

import SwiftUI

private struct Alerts_Message: View {
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            HeaderView("Alerts", subtitle: "Message",
                       desc: "Add a message to your alert with another trailing closure.",
                       back: .green)
            
            Button("Show Alert") {
                showAlert = true
            }
            
            Spacer()
        }
        .alert("Congratulations!", isPresented: $showAlert) {
            // No action/button defined
        } message: {
            Text("You trip is now booked.")
                .font(.largeTitle)
                .foregroundColor(.red)
        }
        .font(.title)
    }
}

struct Alerts_Message_Previews: PreviewProvider {
    static var previews: some View {
        Alerts_Message()
    }
}
