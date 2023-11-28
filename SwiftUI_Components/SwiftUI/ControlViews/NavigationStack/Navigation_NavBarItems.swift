//6/19/19.
import SwiftUI

fileprivate struct Navigation_NavBarItems : View {
    var body: some View {
        NavigationStack {
            VStack {
            }
            .navigationTitle("Navigation Bar Buttons")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "bell.fill")
                            .padding(.horizontal)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Actions", action: { })
                }
            }
            .tint(.pink)
        }
    }
}

struct Navigation_NavBarItems_Previews : PreviewProvider {
    static var previews: some View {
        Navigation_NavBarItems()
    }
}
