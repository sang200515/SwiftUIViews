// 12/25/19.
import SwiftUI

private struct Transition_Challenge1: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Group {
                if show {
                    VStack(spacing: 20) {
                        Spacer()
                        Spacer()
                        Text("explore")
                        Text("T H E  G R E A T  D E S E R T")
                            .font(.system(size: 24, weight: .ultraLight, design: .serif))
                        Button(action: {}) {
                            Text("EXPERIENCE")
                                .padding(10)
                        }
                        .background(Capsule().stroke(Color("Gold"), lineWidth: 1))
                        .tint(Color("Gold"))
                        
                        Spacer()
                        
                    }
                    .font(.system(.body, design: .serif))
                    .transition(.move(edge: .bottom))
                }
            }
            .animation(.easeOut(duration: 1.8), value: show)
            
            VStack {
                Text("Desert Life")
                    .font(Font.system(size: 40, weight: .regular, design: .serif))
                
                Spacer()
                
                if show {
                    Image("desert")
                        .transition(.move(edge: .bottom))
                }
            }
            .animation(.easeOut(duration: 1).delay(0.6), value: show)
        }
        .onAppear {
            show.toggle()
        }
    }
}

struct Transition_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        Transition_Challenge1()
    }
}
