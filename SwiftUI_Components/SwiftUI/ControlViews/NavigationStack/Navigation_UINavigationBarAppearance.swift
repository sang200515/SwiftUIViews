import SwiftUI

private struct Navigation_UINavigationBarAppearance: View {
    var body: some View {
        NavigationStack {
            VStack {

            }
            .navigationTitle("Appearance")
            .font(.title)
        }
        .onAppear {
            let appearance = UINavigationBarAppearance()
            
            appearance.backgroundColor = UIColor(Color.green.opacity(0.25))
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct Navigation_UINavigationBarAppearance_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_UINavigationBarAppearance()
    }
}
