import SwiftUI

private struct Asymmetric_TwoAnimations2: View {
    @State private var showHelp = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Transitions").font(.largeTitle)
                Text("Asymmetric: Two Animations")
                Text("You can attach different animations directly to transitions. (This still hasn't worked since the introduction of SwiftUI.) Filed bug: FB8788383")
                
                ZStack(alignment: .topTrailing) {
                    Color.yellow.opacity(0.85)
                    Button(action: {
                        showHelp = true
                    }, label: {
                        Image(systemName: "questionmark.circle.fill")
                    }).padding()
                }.ignoresSafeArea(edges: .vertical)
            }
            
            // Help View
            if showHelp {
                VStack(spacing: 20) {
                    Text("Help")
                        .foregroundColor(Color.white)
                    Text("Some help text here...")
                    Button("Close") {
                        showHelp = false
                    }.padding(.top, 30)
                }
                .padding(35)
                .background(RoundedRectangle(cornerRadius: 20)
                                .fill(Color.secondary)
                                .shadow(radius: 15))
                .padding(.top, 100)
                
                .transition(AnyTransition.slide)


                // Attached animations on the transitions does not work ----------
                // Single
//                .transition(AnyTransition.slide.animation(.default))
                
                // Asymmetric
//                .transition(.asymmetric(insertion: AnyTransition.slide.animation(Animation.spring()),
//                                        removal: AnyTransition.move(edge: .bottom).animation(.easeIn)))
                .zIndex(1)
            }
        }
        .animation(.default, value: showHelp) // The only solution so far
        .font(.title)
    }
}


struct Asymmetric_TwoAnimations2_Previews: PreviewProvider {
    static var previews: some View {
        Asymmetric_TwoAnimations2()
    }
}
