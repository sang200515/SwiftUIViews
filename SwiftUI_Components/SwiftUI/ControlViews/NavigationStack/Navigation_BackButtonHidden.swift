//9/21/19.
import SwiftUI

// First Screen
private struct Navigation_BackButtonHidden: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Go To Detail", destination: BackButtonHiddenDetail())
                .font(.title)
                .navigationTitle("Navigation Views")
        }
    }
}

// Second Screen
private struct BackButtonHiddenDetail: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Go Back") {
            dismiss()
        }
        .font(.title)
        .navigationTitle("Detail View")
        .navigationBarBackButtonHidden(true)
    }
}


struct Navigation_BackButtonHidden_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Navigation_BackButtonHidden()
            BackButtonHiddenDetail()
        }
    }
}
