// 12/23/19.
import SwiftUI

private struct Exercise_Transition_Step1Transitions: View {
    @State private var step1 = true
    
    var body: some View {
        ZStack {
            Color("Background3")
            
            VStack(spacing: 60) {
                Spacer()
                
                if step1 {
                    Text("Ready to travel?")
                        .bold()
                        .foregroundColor(Color("Secondary3"))
                        .transition(.move(edge: .leading))
                }
                
                if step1 {
                    VStack(spacing: 60) {
                        Image("traveling")
                            .animation(.easeIn(duration: 1), value: step1)
                        
                        Capsule()
                            .fill(Color("Secondary3"))
                            .frame(height: 100)
                            .offset(x: -50)
                            .animation(.easeInOut(duration: 0.6), value: step1)
                            .overlay(Text("Let's go!")
                                .foregroundColor(Color("Foreground3"))
                                .animation(.easeOut(duration: 0.6), value: step1))
                    }
                    .transition(.move(edge: .leading))
                }
                Spacer()
            }
            .animation(.easeOut(duration: 1.1), value: step1)
            
            VStack {
                Spacer()
                HStack(spacing: 40) {
                    Button(action: {
                        step1.toggle()
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .rotationEffect(.degrees(step1 ? 180 : 0))
                    })
                }
                .font(.system(size: 50))
                .animation(.easeOut(duration: 1), value: step1)
            }
            .padding(.bottom, 75)
        }
        .font(.largeTitle)
        .tint(Color("Accent3"))
        .ignoresSafeArea()
    }
}

struct Exercise_Transition_Step1Transitions_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_Transition_Step1Transitions()
    }
}
