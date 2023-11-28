import SwiftUI

fileprivate struct MGE_ShowingTheDetailView: View {
    @Namespace var namespace
    @State var selectedPark: Item?
    @State var parks = Data.getUtahNationalParks()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12, pinnedViews: .sectionHeaders) {
                Section(header: MGE_HeaderView()) {
                    ForEach(parks) { park in
                        ParksRowView(namespace: namespace, selectedPark: $selectedPark, park: park)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .overlay(
            MGE_ParkDetailView(namespace: namespace, selectedPark: $selectedPark)
        )
    }
}

struct MGE_ShowingTheDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MGE_ShowingTheDetailView()
    }
}
