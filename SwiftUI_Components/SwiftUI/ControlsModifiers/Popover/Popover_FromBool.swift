//8/18/19.
import SwiftUI

fileprivate struct Popover_FromBool: View {
    @State private var showPopover = false
    
    var body: some View {
        ZStack {
            Color("Theme1Background")
            
            Button(action: {
                self.showPopover = true
            }, label: {
                Image(systemName: "questionmark.circle.fill")
                    .font(.largeTitle)
            }).popover(isPresented: $showPopover, arrowEdge: .top) {
                // This will show in the Popover
                VStack(spacing: 20) {
                    Text("Popover")
                        .font(.largeTitle)
                    Text("Show from Bool")
                        .font(.title).foregroundColor(.gray)
                    Text("By changing the State variable, you can trigger the Popover to show")
                        .frame(maxWidth: .infinity)
                        .padding().font(.title)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(height: 210)
            }
        }
        .ignoresSafeArea()
    }
}

struct Popover_FromBool_Previews: PreviewProvider {
    static var previews: some View {
        Popover_FromBool()
        //.previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
    }
}
