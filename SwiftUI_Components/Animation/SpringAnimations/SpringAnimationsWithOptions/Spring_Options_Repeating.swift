// 12/8/19.
import SwiftUI

private struct Spring_Options_Repeating: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                TitleText("Spring Options")
                    .foregroundColor(Color("Gold"))
                SubtitleText("Repeat")
                BannerText("Here are different options for repeating spring animations.",
                           backColor: Color("Gold"))
                
                Button("Start") {
                    change.toggle()
                }
                .foregroundColor(Color("Accent"))
                
                Group {
                    Text("Using dampingFraction = 0")
                    Text("(spring animation)").font(.body).foregroundColor(.white)
                    Circle()
                        .fill(Color("Gold"))
                        .frame(height: 70)
                        .offset(x: change ? 20 : -20)
                        .animation(.spring(response: 1, dampingFraction: 0), value: change)
                    Text("Using dampingFraction = 0")
                    Text("(interpolatingSpring animation").font(.body).foregroundColor(.white)
                    Circle()
                        .fill(Color("Gold"))
                        .frame(height: 70)
                        .offset(x: change ? 20 : -20)
                        .animation(.interpolatingSpring(stiffness: 40, damping: 0), value: change)
                    Text("Repeat 3 times")
                    Circle()
                        .fill(Color("Gold"))
                        .frame(height: 70)
                        .offset(x: change ? 40 : -40)
                        .animation(.spring(response: 0.5, dampingFraction: 0.5)
                            .repeatCount(3, autoreverses: false), value: change)
                    Text("Repeat Forever")
                    Circle()
                        .fill(Color("Gold"))
                        .frame(height: 70)
                        .offset(x: change ? 40 : -40)
                        .animation(.spring(response: 0.5, dampingFraction: 0.5)
                            .repeatForever(autoreverses: false), value: change)
                }
            }
            .font(.title)
            .foregroundColor(Color("Gold"))
            .onAppear {
                change.toggle()
            }
        }
    }
}

struct Spring_Options_Repeating_Previews: PreviewProvider {
    static var previews: some View {
        Spring_Options_Repeating()
    }
}
