import SwiftUI

fileprivate struct TabView_Customizations: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("TabView",
                       subtitle: "Customizations",
                       desc: "You could include the TabView as another way to do horizontal scrolling through data.")
            
            Text("People")
            
            TabView {
                ForEach(1 ..< 21) { index in
                    VStack(spacing: 20) {
                        Text("Person \(index)")
                        Image("profile\(index)")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(16)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.yellow.opacity(0.7)))
                    .padding()
                }
            }
        }
        .font(.title)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}
#Preview {
    TabView_Customizations()
}
