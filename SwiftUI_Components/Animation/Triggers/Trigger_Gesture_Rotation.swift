//
//  Trigger_Gesture_Rotation.swift
//  SwiftUIAnimations
//
// 11/5/19.
import SwiftUI

fileprivate struct Trigger_Gesture_Rotation: View {
    @State private var degrees = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Triggers")
            SubtitleText("Rotation Gesture")
            BannerText("Use the rotation gesture to change an angle of a view and the animation will smooth out the rotation effect.", backColor: .green)
            Spacer()
            Group {
                Image(systemName: "gear")
                    .font(.system(size: 300))
                    .rotationEffect(Angle.degrees(degrees))
                    .gesture(RotationGesture()
                        .onChanged({ (angle) in
                            degrees = angle.degrees
                        }))
                    .animation(.default, value: degrees) // Smooth out the rotation
                Image(systemName: "gear")
                    .font(.system(size: 140))
                    .rotationEffect(-Angle.degrees(degrees))
                    .offset(x: 130, y: 10)
                    .animation(.default, value: degrees) // Smooth out the rotation
                Image(systemName: "gear")
                    .font(.system(size: 80))
                    .rotationEffect(Angle.degrees(degrees))
                    .offset(x: 60)
                    .animation(.default, value: degrees) // Smooth out the rotation
            }
            .foregroundColor(.green)
            Spacer()
        }
        .font(.title)
    }
}

struct Trigger_Gesture_Rotation_Previews: PreviewProvider {
    static var previews: some View {
        Trigger_Gesture_Rotation()
    }
}
