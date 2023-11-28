//
//  Spring_CheckUnderstanding1.swift
//  SwiftUIAnimations
//
// 12/8/19.
import SwiftUI

fileprivate struct Spring_CheckUnderstanding1: View {
    @State private var isOn = false
    
    var body: some View {
        Button(action: {
            isOn.toggle()
        }) {
            Text(isOn ? "ON" : "OFF")
                .foregroundColor(.white)
                .padding()
                .animation(.none, value: isOn) // Don't animate the text change
        }
        .padding(.horizontal, 24)
        .background(Capsule().fill(isOn ? Color.green : Color.red))
        .scaleEffect(isOn ? 1.4 : 1)
        .shadow(color: isOn ? .green : .red,
                radius: isOn ? 10 : 5, x: 0,
                y: isOn ? 10 : 5)
        .animation(.interpolatingSpring(stiffness: 20, damping: 5, initialVelocity: -10), value: isOn)
    }
}

struct Spring_CheckUnderstanding1_Previews: PreviewProvider {
    static var previews: some View {
        Spring_CheckUnderstanding1()
    }
}
