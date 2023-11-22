import SwiftUI

private struct MGE_SetupTheLazyVStack: View {
    @Namespace var namespace
    @State var selectedPark: Item?
    @State var parks = Data.getUtahNationalParks()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(parks) { park in
                    Image(park.imageName)
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(30)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct MGE_SetupTheLazyVStack_Previews: PreviewProvider {
    static var previews: some View {
        MGE_SetupTheLazyVStack()
    }
}
