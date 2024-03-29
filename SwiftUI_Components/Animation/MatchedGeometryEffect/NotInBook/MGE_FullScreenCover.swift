import SwiftUI

fileprivate struct MGE_FullScreenCover: View {
    @State private var showDetailView = false
    @Namespace var namespace
    
    var body: some View {
        VStack {
            Text("This does not work. ☹️")
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
        }
        .tint(.blue)
        .fullScreenCover(isPresented: $showDetailView) {
            MGE_FullScreenCoverDetailView(namespace: namespace)
            //                .transition(.move(edge: .bottom))
        }
        .animation(.easeIn, value: showDetailView)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                showDetailView.toggle()
            }
        }
    }
}

struct MGE_FullScreenCover_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MGE_FullScreenCover()
        }
    }
}

// Detail View
struct MGE_FullScreenCoverDetailView: View {
    var namespace: Namespace.ID
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
                .matchedGeometryEffect(id: "transition", in: namespace)
            
            VStack {
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Show Details")
                        .foregroundColor(.white)
                        .padding()
                })
            }
            .tint(.blue)
        }
    }
}
