import SwiftUI

fileprivate struct List_HeaderFooter_Automatic: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("List",
                       subtitle: "Automatic - Headers & Footers",
                       desc: "This list style also changes the way headers and footers are rendered.",
                       back: .green, textColor: .black)
            List {
                Section {
                    Label("Learn Geography", systemImage: "signpost.right.fill")
                    Label("Learn Music", systemImage: "doc.richtext")
                    Label("Learn Photography", systemImage: "camera.aperture")
                    Label("Learn Art", systemImage: "paintpalette.fill")
                    Label("Learn Physics", systemImage: "atom")
                } header: {
                    Text("What would you like to learn?")
                } footer: {
                    Text("Count: 5")
                }
            }
            .listStyle(.automatic)
        }
        .font(.title)
    }
}

struct List_HeaderFooter_Automatic_Previews: PreviewProvider {
    static var previews: some View {
        List_HeaderFooter_Automatic()
            .preferredColorScheme(.dark)
    }
}
