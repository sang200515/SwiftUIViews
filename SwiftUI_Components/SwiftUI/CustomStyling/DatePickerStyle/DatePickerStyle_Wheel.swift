import SwiftUI

fileprivate struct DatePickerStyle_Wheel: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Date Picker Style", subtitle: "Wheel Style", desc: "As you probably saw from the chapter introducing date pickers, there is the wheel style too.",
                       back: .green)
                .font(.title)
            Text("WheelDatePickerStyle Applied:")
                .font(.title)
            DatePicker("WheelDatePickerStyle Applied:", selection: $selectedDate,
                       displayedComponents: .date)
                .datePickerStyle(.wheel)
                .labelsHidden()
                .padding(.horizontal)
        }
        .minimumScaleFactor(0.5)
    }
}

#Preview {
    DatePickerStyle_Wheel()
}
