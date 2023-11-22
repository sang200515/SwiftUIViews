import SwiftUI

private struct MGE_WithParentAndChildViews: View {
    @State private var showDetailView = false
    @Namespace var namespace
    
    var body: some View {
        VStack {
            if showDetailView {
                MGE_DetailView(namespace: namespace, showDetailView: $showDetailView)
            } else {
                MGE_ParentView(namespace: namespace, showDetailView: $showDetailView)
            }
        }
        .animation(.easeIn, value: showDetailView)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                showDetailView.toggle()
            }
        }
    }
}

struct MGE_WithParentAndChildViews_Previews: PreviewProvider {
    static var previews: some View {
        MGE_WithParentAndChildViews()
    }
}

private  struct MGE_ParentView: View {
    var namespace: Namespace.ID
    @Binding var showDetailView: Bool
    
    var body: some View {
        VStack {
            Text("Parent View")
                .font(.largeTitle)
            
            Spacer()
            
            Button(action: {
                showDetailView.toggle()
            }, label: {
                Text("Show Details")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Capsule()
                                    .matchedGeometryEffect(id: "transition", in: namespace))
            })
            
            Spacer()
        }
        .tint(.blue)
    }
}

private  struct MGE_DetailView: View {
    var namespace: Namespace.ID
    @Binding var showDetailView: Bool
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
                .matchedGeometryEffect(id: "transition", in: namespace)
            
            VStack {
                Text("Detail View")
                    .font(.largeTitle)
                
                Spacer()
                
                Button(action: {
                    showDetailView.toggle()
                }, label: {
                    Text("Back")
                        .foregroundColor(.white)
                        .padding()
                })
                
                Spacer()
            }
            .tint(.blue)
        }
    }
}
