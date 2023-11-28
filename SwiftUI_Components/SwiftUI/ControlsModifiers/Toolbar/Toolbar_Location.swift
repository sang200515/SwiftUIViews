import SwiftUI

fileprivate struct Toolbar_Location: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

            }
            .navigationTitle(Text("Toolbar"))
            .font(.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3")
                            .padding(.horizontal)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .padding(.horizontal)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {}) {
                        Image(systemName: "aspectratio")
                        Text("Aspect Ratio")
                    }
                }
            }
            .tint(.green)
        }
    }
}

struct Toolbar_Location_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar_Location()
    }
}
