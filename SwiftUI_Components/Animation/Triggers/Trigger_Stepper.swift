//
//  Trigger_Stepper.swift
//  SwiftUIAnimations
//
// 11/5/19.
import SwiftUI

private struct Trigger_Stepper: View {
    @State private var stepperValue: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Triggers")
            SubtitleText("Stepper")
            BannerText("The stepper increments and decrements values which can be applied to a number of modifiers and then animated.",
                       backColor: .green)
            
            ZStack {
                ForEach(0...40, id: \.self) { _ in
                    Circle()
                        .foregroundColor(.green).opacity(0.2)
                        .frame(width: .random(in: 10...100),
                               height: .random(in: 10...100))
                        .position(x: .random(in: stepperValue...400),
                                  y: .random(in: stepperValue...400))
                        .animation(.default, value: stepperValue) // Animate the change in position
                }
            }
            
            Stepper("Adjust", value: $stepperValue, in: 1.0...5.0)
                .padding()
        }
        .font(.title)
    }
}

struct Trigger_Stepper_Previews: PreviewProvider {
    static var previews: some View {
        Trigger_Stepper()
    }
}
