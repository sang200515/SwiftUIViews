// 12/3/19.
import SwiftUI

private struct Spring_BlendDuration_SideBySide: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                TitleText("Spring").foregroundColor(Color("Gold"))
                SubtitleText("Blend Duration Comparison")
                BannerText("Blend Duration: The duration in seconds over which to interpolate changes to the response value of the spring. Response set to 0.55.", backColor: Color("Gold"))
                
                Button("Compare Blend Durations") {
                    change.toggle()
                }
                
                HStack(alignment: .bottom) {
                    VStack {
                        Text("-100").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(Animation.spring(response: 0.55, dampingFraction: 0.825, blendDuration: -100), value: change)
                    }
                    VStack {
                        Text("-5").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(Animation.spring(response: 0.55, dampingFraction: 0.825, blendDuration: -5), value: change)
                    }
                    VStack {
                        Text("0").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(Animation.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0), value: change)
                    }
                    VStack {
                        Text("0.5").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(Animation.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0.5), value: change)
                    }
                    VStack {
                        Text("1").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(Animation.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 1), value: change)
                    }
                    VStack {
                        Text("10").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(Animation.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 10), value: change)
                    }
                    VStack {
                        Text("50").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(Animation.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 50), value: change)
                    }
                    VStack {
                        Text("100").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(Animation.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 100), value: change)
                    }
                    VStack {
                        Text("250").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(Animation.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 250), value: change)
                    }
                    VStack {
                        Text("500").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(Animation.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 500), value: change)
                    }
                }.foregroundColor(.white)
                
                Spacer()
            }
        }
    }
}

struct Spring_BlendDuration_SideBySide_Previews: PreviewProvider {
    static var previews: some View {
        Spring_BlendDuration_SideBySide()
    }
}
