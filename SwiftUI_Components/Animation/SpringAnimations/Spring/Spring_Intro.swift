// 9/30/19.
import SwiftUI

fileprivate struct Spring_Intro: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("Spring").foregroundColor(Color("Gold"))
                SubtitleText("Introduction")
                BannerText("The spring animation adds a bounce to your animations.", backColor: Color("Gold"))
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color("Gold"))
                    .overlay(Image("Phone"))
                    .padding()
                    .scaleEffect(show ? 1 : 0.01, anchor: .bottom)
                    .opacity(show ? 1 : 0)
                    .animation(.spring(), value: show) // Simplest spring animation
                
                Button(action: {
                    show.toggle()
                }, label: {
                    Image(systemName: show ? "person.2.fill" : "person.2")
                        .foregroundColor(Color("Gold"))
                        .font(.largeTitle)
                }).tint(Color("Accent"))
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                            show.toggle()
                        }
                    }
            }
        }
    }
}

struct Spring_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Spring_Intro()
    }
}
