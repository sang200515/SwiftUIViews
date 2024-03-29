import SwiftUI

fileprivate struct List_ListSectionSeparatorTint: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderView("List",
                       subtitle: "ListSectionSeparatorTint",
                       desc: "Use the listSectionSeparatorTint to modify the color of the separator.")
            
            List {
                Section {
                    Text("Row 1")
                    Text("Row 2")
                    Text("Row 3")
                    Text("Row 4")
                } header: {
                    Text("Section 1")
                }
                .listSectionSeparatorTint(.red)

                Section {
                    Text("Row 5")
                    Text("Row 6")
                    Text("Row 7")
                } header: {
                    Text("Section 1")
                }
                .listSectionSeparatorTint(.green, edges: .bottom)
                #warning("Top not working yet.")
            }
            .listStyle(.plain) // Bottom only
//            .listStyle(.automatic) // No affect
//            .listStyle(.grouped) // Bottom only
//            .listStyle(.sidebar) // No affect
//            .listStyle(.inset) // Bottom only
//            .listStyle(.insetGrouped) // No affect
        }
        .font(.title)
    }
}

struct List_ListSectionSeparatorTint_Previews: PreviewProvider {
    static var previews: some View {
        List_ListSectionSeparatorTint()
            .preferredColorScheme(.dark)
    }
}
