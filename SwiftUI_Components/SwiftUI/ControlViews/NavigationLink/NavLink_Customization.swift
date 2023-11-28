import SwiftUI

fileprivate struct NavLink_Customization: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink(destination: SecondView()) {
                    Text("Navigate")
                        .foregroundColor(.white)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .tint(.pink)
                
                NavigationLink(destination: SecondView()) {
                    LabeledContent("Navigate") {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.accentColor)
                    }
                    .padding()
                }
            }
            .navigationTitle("NavigationLink")
        }
        .font(.title)
    }
}

struct NavLink_Customization_Previews: PreviewProvider {
    static var previews: some View {
        NavLink_Customization()
    }
}
