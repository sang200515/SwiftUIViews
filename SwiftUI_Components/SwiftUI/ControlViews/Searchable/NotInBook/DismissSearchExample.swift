import SwiftUI

private struct DismissSearchExample: View {
    @State private var locationSearch = ""
//    @Environment(\.isSearching) var isSearching
//    @Environment(\.dismissSearch) var dismissSearch
    
    var body: some View {
        NavigationStack {
            VStack {
                // Will ALWAYS be false
//                Text("Parent: Searching? \(isSearching.description)")
//                // Will NOT cancel search
//                Button("Cancel Search") { dismissSearch() }
                // These things work only in sub views:
                DismissSearchExampleDetail()
            }
            .font(.largeTitle)
        }
        .searchable(text: $locationSearch)
    }
}

private struct DismissSearchExampleDetail: View {
    @Environment(\.isSearching) var isSearching
    @Environment(\.dismissSearch) var dismissSearch
    
    var body: some View {
        VStack {
            Text("Detail: Searching? \(isSearching.description)")
            Button("Cancel Search") { dismissSearch() }
        }
    }
}

struct DismissSearchExample_Previews: PreviewProvider {
    static var previews: some View {
        DismissSearchExample()
    }
}
