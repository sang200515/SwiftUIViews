import SwiftUI

fileprivate struct FB9803194: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            Text("Select different dates in DatePicker:")
            
            DatePicker(selection: $selectedDate, label: { Text("Date") })
        }
    }
}

struct FB9803194_Previews: PreviewProvider {
    static var previews: some View {
        FB9803194()
    }
}
