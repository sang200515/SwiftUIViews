// 12/8/19.
import SwiftUI

fileprivate struct Spring_Options_Delay: View {
    @State private var show = false
    @State private var largeScale: CGFloat = 5
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                TitleText("Spring Options")
                    .foregroundColor(Color("Gold"))
                SubtitleText("Delay")
                BannerText("Use the delay to sequence spring animations.",
                           backColor: Color("Gold"))
                
                Button("Start") {
                    show.toggle()
                }
                .font(.title)
                .tint(Color("Accent"))
                
                Spacer()
                
                HStack(spacing: 30) {
                    Group {
                        Image(systemName: "1.circle")
                            .opacity(show ? 1 : 0)
                            .scaleEffect(show ? 1 : largeScale)
                            .animation(.spring(response: 0.4, dampingFraction: 0.5),
                                       value: show)
                        
                        Image(systemName: "2.circle")
                            .opacity(show ? 1 : 0)
                            .scaleEffect(show ? 1 : largeScale)
                            .animation(.spring(response: 0.4, dampingFraction: 0.5)
                                        .delay(0.3), // Delay for sequence
                                       value: show)
                        
                        Image(systemName: "3.circle")
                            .opacity(show ? 1 : 0)
                            .scaleEffect(show ? 1 : largeScale)
                            .animation(.spring(response: 0.4, dampingFraction: 0.5)
                                        .delay(0.6), // Delay for sequence
                                       value: show)
                    }
                    .foregroundColor(Color("Gold"))
                    .font(.system(size: 100))
                }
                Spacer()
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                    show.toggle()
                }
            }
        }
    }
}

struct Spring_Options_Delay_Previews: PreviewProvider {
    static var previews: some View {
        Spring_Options_Delay()
    }
}
