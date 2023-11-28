import SwiftUI

fileprivate struct ToggleTint: View {
    @State private var isLockAssistOn = false
    
    var body: some View {
        Toggle(isOn: $isLockAssistOn) {
            Image(systemName: "lock.square")
                .font(.largeTitle)
                .foregroundColor(.red)
                .symbolVariant(isLockAssistOn ? .fill : .none)
        }
        .tint(.clear)
        .toggleStyle(.button)
    }
}

struct ToggleTint_Previews: PreviewProvider {
    static var previews: some View {
        ToggleTint()
            .previewLayout(.sizeThatFits)
    }
}
