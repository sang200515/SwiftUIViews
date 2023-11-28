import SwiftUI

fileprivate struct DatePickerStyle_Compact: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Date Picker Style", subtitle: "Compact Style", desc: "Not much of a difference form the default style in iOS.",
                       back: .green)
                .font(.title)
            DatePicker("CompactDatePickerStyle Applied:", selection: $selectedDate,
                       displayedComponents: .date)
                .datePickerStyle(.compact)
                .padding(32)
        }
        .minimumScaleFactor(0.5)
    }
}

#Preview {
    DatePickerStyle_Compact()
}
