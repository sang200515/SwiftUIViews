import SwiftUI

private struct DatePickerStyle_Graphical: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Date Picker Style", subtitle: "Graphical Style", desc: "There is also the graphical view introduced in iOS 14.",
                       back: .green)
                .font(.title)
            Text("GraphicalDatePickerStyle Applied:")
                .font(.title)
            DatePicker("GraphicalDatePickerStyle Applied:", selection: $selectedDate,
                       displayedComponents: .date)
                .datePickerStyle(.graphical)
                .labelsHidden()
                .padding(32)
        }
        .minimumScaleFactor(0.5)
    }
}

#Preview {
    DatePickerStyle_Graphical()
}
