import SwiftUI

fileprivate struct MGE_AddSectionView: View {
    @Namespace var namespace
    @State var selectedPark: Item?
    @State var parks = Data.getUtahNationalParks()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12, pinnedViews: .sectionHeaders) {
                Section(header: ParksSectionHeaderView()) {
                    ForEach(parks) { park in
                        ParksRowView(namespace: namespace, selectedPark: $selectedPark, park: park)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ParksSectionHeaderView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(UIColor.systemBackground)
                .opacity(0.8)
            
            Text("UTAH  NATIONAL  PARKS")
                .font(.title)
                .fontWeight(.black)
                .padding()
                .frame(maxWidth: .infinity)
        }
        .frame(height: 100)
    }
}

struct MGE_AddSectionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ParksSectionHeaderView()
                .previewLayout(.sizeThatFits)
            MGE_AddSectionView()
        }
    }
}
