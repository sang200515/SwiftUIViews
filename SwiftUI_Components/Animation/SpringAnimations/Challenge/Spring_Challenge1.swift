//
//  Spring_Challenge1.swift
//  SwiftUIAnimations
//
// 12/8/19.
import SwiftUI

fileprivate struct Spring_Challenge1: View {//flag
    @State private var step = 1
    
    var body: some View {
        ZStack {
            // Background color
            Color("DarkShade2")
                .ignoresSafeArea()
            
            Rectangle()
                .fill(Color("DarkAccent2"))
                .scaleEffect(1.4)
                .rotationEffect(.degrees(-15))
                .offset(x: -100, y: 300)
            
            VStack(spacing: 30) {
                Text("Welcome to")
                    .font(.largeTitle)
                    .foregroundColor(Color("LightShade2"))
                    .padding(.top)
                Text("SwiftUI Animations")
                    .font(.largeTitle).bold()
                    .foregroundColor(Color("LightShade2"))
                
                GeometryReader { gp in
                    HStack {
                        VStack(spacing: 40) {
                            Image("woman.reading")
                            Text("Learn by watching videos and looking at code.")
                                .padding()
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1), value: step)
                        }.frame(width: gp.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            Image("woman.solving.problem")
                            Text("Step-by-step exercises, quizzes and practical challenges.")
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1), value: step)
                        }.frame(width: gp.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            Image("woman.bike")
                            Text("Master SwiftUI Animations Today!")
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1), value: step)
                        }.frame(width: gp.frame(in: .global).width)
                    }
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("LightAccent2"))
                    .font(.title)
                    .padding(.vertical, 60)
                    .frame(width: gp.frame(in: .global).width * 3) // Make HStack 3X width of device
                    .frame(maxHeight: .infinity)
                    .offset(x: step == 1 ? 0
                                : step == 2 ? -gp.frame(in: .global).width
                                : -gp.frame(in: .global).width * 2)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8), value: step)
                }
                
                HStack(spacing: 20) {
                    Button(action: { step = 1 }) {
                        Text("1")
                            .padding()
                            .background(Circle().fill(Color("Accent2")).shadow(radius: 10))
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    
                    Button(action: { step = 2 }) {
                        Text("2")
                            .padding()
                            .background(Circle().fill(Color("Accent2")).shadow(radius: 10))
                            .scaleEffect(step == 2 ? 1 : 0.65)
                    }
                    
                    Button(action: { step = 3 }) {
                        Text("3")
                            .padding()
                            .background(Circle().fill(Color("Accent2")).shadow(radius: 10))
                            .scaleEffect(step == 3 ? 1 : 0.65)
                    }
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.5), value: step)
                .font(.largeTitle)
                .tint(Color("LightShade2"))
                
                Button(action: {}) {
                    HStack {
                        Text("Continue")
                        Image(systemName: "chevron.right")
                    }
                    .padding(.horizontal)
                    .padding()
                    .background(Capsule().fill(Color("Accent2")))
                    .foregroundColor(Color("LightShade2"))
                    .opacity(step == 3 ? 1 : 0)
                    .animation(.none, value: step) // I don't want to animate the opacity ☝️
                    .scaleEffect(step == 3 ? 1 : 0.01)
                    .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10, initialVelocity: 10), value: step)
                }
            }
        }
    }
}

struct Spring_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        Spring_Challenge1()
    }
}
