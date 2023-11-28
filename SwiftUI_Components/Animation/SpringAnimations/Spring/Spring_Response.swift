// 12/1/19.
import SwiftUI

fileprivate struct Spring_Response: View {//flag
    @State private var show = false
    @State private var response = 0.55 // This is the default response value
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                TitleText("Spring").foregroundColor(Color("Gold"))
                SubtitleText("Response")
                BannerText("Using the response parameter you can adjust the spring's response to being activated. Will it respond quickly or slowly?", backColor: Color("Gold"))
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color("Gold"))
                    .overlay(Image("Phone"))
                    .padding()
                    .scaleEffect(show ? 1 : 0.01, anchor: .bottom)
                    .opacity(show ? 1 : 0)
                    .animation(.spring(response: response, dampingFraction: 0.5), value: show) // Adjust the response
                
                Button(action: {
                    show.toggle()
                }, label: {
                    Image(systemName: show ? "person.2.fill" : "person.2")
                        .foregroundColor(Color("Gold"))
                        .font(.largeTitle)
                }).tint(Color("Accent"))
                
                HStack {
                    Image(systemName: "0.circle.fill")
                    Slider(value: $response, in: 0...4) // 0 to 4 seconds
                    Image(systemName: "4.circle.fill")
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

struct Spring_Response_Previews: PreviewProvider {
    static var previews: some View {
        Spring_Response()
    }
}
