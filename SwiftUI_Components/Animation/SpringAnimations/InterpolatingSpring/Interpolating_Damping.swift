//
//  Interpolating_Damping.swift
//  SwiftUIAnimations
//
// 12/3/19.
import SwiftUI

private struct Interpolating_Damping: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                TitleText("Interpolating Spring").foregroundColor(Color("Gold"))
                SubtitleText("Damping")
                BannerText("Damping controls how much drag or friction is added to the spring.", backColor: Color("Gold"))
                
                Button("Compare Damping") {
                    change.toggle()
                }
                HStack(alignment: .bottom, spacing: 40) {
                    VStack {
                        Text("0").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(stiffness: 10, damping: 0), value: change)
                    }
                    VStack {
                        Text("0.5").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(stiffness: 10, damping: 0.5), value: change)
                    }
                    VStack {
                        Text("1").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(stiffness: 10, damping: 1), value: change)
                    }
                    VStack {
                        Text("3").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(stiffness: 10, damping: 3), value: change)
                    }
                    VStack {
                        Text("5").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(stiffness: 10, damping: 5), value: change)
                    }
                }
                .font(.system(size: 25))
                .foregroundColor(.white)
            }
            .font(.title)
        }
    }
}

struct Interpolating_Damping_Previews: PreviewProvider {
    static var previews: some View {
        Interpolating_Damping()
    }
}
