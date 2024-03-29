import SwiftUI

fileprivate struct MGE_View1_To_View2_Problem: View {
    @State private var showView2 = false
    @Namespace var namespace
    
    var body: some View {
        VStack {
            VStack {
                if showView2 == false {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.green)
                        .overlay(Text("View 1"))
                        .matchedGeometryEffect(id: "change", in: namespace)
                }
            }
            .frame(height: 200)
            
            Button("Change") {
                showView2.toggle()
            }
            
            VStack {
                if showView2 {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.yellow)
                        .matchedGeometryEffect(id: "change", in: namespace)
                        .frame(width: 200, height: 200)
                        .overlay(Text("View 2"))
                }
            }
            .frame(height: 200)
        }
        .animation(.default, value: showView2)
        .font(.title)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                showView2.toggle()
            }
        }
    }
}

struct MGE_View1_To_View2_Problem_Previews: PreviewProvider {
    static var previews: some View {
        MGE_View1_To_View2_Problem()
    }
}
