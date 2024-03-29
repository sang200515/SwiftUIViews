import SwiftUI

fileprivate struct MultiDatePicker_Customizations: View {
    @State private var dates: Set<DateComponents> = [
        DateComponents(year: 2022, month: 9, day: 6),
        DateComponents(year: 2022, month: 9, day: 7),
        DateComponents(year: 2022, month: 9, day: 8)
    ]
    
    var body: some View {
            MultiDatePicker("Customizations", selection: $dates)
                .tint(.red)
                .foregroundColor(.purple) // Does nothing
                .foregroundStyle(.purple) // nothing
                .background(.quaternary.opacity(0.5),
                            in: RoundedRectangle(cornerRadius: 16))
                .padding()
    }
}

struct MultiDatePicker_Customizations_Previews: PreviewProvider {
    static var previews: some View {
        MultiDatePicker_Customizations()
    }
}
