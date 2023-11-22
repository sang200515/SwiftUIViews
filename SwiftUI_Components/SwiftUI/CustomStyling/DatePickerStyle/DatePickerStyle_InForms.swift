import SwiftUI

private struct DatePickerStyle_InForms: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView("Date Picker Style", subtitle: "In Forms", desc: "By default, pickers in a form are compact. Other styles:",
                       back: .green)
                .font(.title)
            Form {
                Section {
                    DatePicker("Select:", selection: $selectedDate,
                               displayedComponents: .date)
                } header: {
                    Text("Default")
                }
                
                Section {
                    DatePicker("Select:", selection: $selectedDate,
                               displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                } header: {
                    Text("WheelDatePickerStyle")
                }
                
                Section {
                    DatePicker("Select:", selection: $selectedDate,
                               displayedComponents: .date)
                        .datePickerStyle(.graphical)
                } header: {
                    Text("Graphical")
                }
            }
        }
    }
}
#Preview {
    DatePickerStyle_InForms()
}
