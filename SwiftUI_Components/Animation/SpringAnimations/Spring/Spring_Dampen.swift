// 9/30/19.
import SwiftUI

private struct Spring_Dampen: View {
    @State private var show = false
    @State private var dampingFraction = 0.825 // This is the default damping fraction
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                TitleText("Spring").foregroundColor(Color("Gold"))
                SubtitleText("Dampen")
                BannerText("Spring animations have a dampen property that dampens or make your spring less strong or intense.", backColor: Color("Gold"))
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color("Gold"))
                    .overlay(Image("Phone"))
                    .padding()
                    .scaleEffect(show ? 1 : 0.01, anchor: .bottom)
                    .opacity(show ? 1 : 0)
                    .animation(.spring(dampingFraction: dampingFraction), value: show) // Adjust the "springiness"
                
                Button(action: {
                    show.toggle()
                }, label: {
                    Image(systemName: show ? "person.2.fill" : "person.2")
                        .foregroundColor(Color("Gold"))
                        .font(.largeTitle)
                }).tint(Color("Accent"))
                
                HStack {
                    Image(systemName: "0.circle.fill")
                    Slider(value: $dampingFraction)
                    Image(systemName: "1.circle.fill")
                }
                .foregroundColor(Color("Gold")).padding()
            }
            .font(.title)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                    show.toggle()
                }
            }
        }
    }
}

struct Spring_Dampen_Previews: PreviewProvider {
    static var previews: some View {
        Spring_Dampen()
    }
}
