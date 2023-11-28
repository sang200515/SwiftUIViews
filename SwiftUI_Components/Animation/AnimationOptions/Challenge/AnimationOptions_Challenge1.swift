
import SwiftUI

fileprivate struct AnimationOptions_Challenge1: View {
    @State private var showMenu = false
    @State private var showButtons = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("CHALLENGE").foregroundColor(Color("Gold"))
                SubtitleText("Recreate this Animation")
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color("Brown"))
                    .padding(.horizontal)
                
                GeometryReader { gp in
                    HStack(spacing: 30) {
                        Spacer()
                        Group {
                            Image(systemName: "pencil")
                            Image(systemName: "scribble")
                            Image(systemName: "lasso")
                            Image(systemName: "scissors")
                        }
                        .opacity(showButtons ? 1 : 0)
                        
                        Button(action: {
                            withAnimation(.default) {
                                showMenu.toggle()
                            }
                            withAnimation(.default.delay(0.3)) {
                                showButtons.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3.decrease")
                                .rotationEffect(.degrees(-90))
                        }
                        .offset(x: 10)
                    }
                    .padding(20)
                    .foregroundColor((Color("Accent")))
                    .background(Capsule().fill(Color("Gold")))
                    .font(.largeTitle)
                    .offset(x: showMenu ? -40 : -gp.frame(in: .local).width + 40)
                }
                .frame(height: 100)
            }
        }
    }
}

struct AnimationOptions_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptions_Challenge1()
    }
}
