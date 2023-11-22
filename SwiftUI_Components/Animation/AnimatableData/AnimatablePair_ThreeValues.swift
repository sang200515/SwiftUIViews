// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

private struct AnimatablePair_ThreeValues: View {
    @State private var xOffset: CGFloat = 0.0
    @State private var yOffset: CGFloat = 0.0
    @State private var verticalInset: CGFloat = 0.0

    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("AnimatablePair")
            SubtitleText("Three Values")
            BannerText("You can nest the AnimatablePair for more than 2 values.",
                       backColor: Color("Gold"))
            
                Button("Animate") {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.2)) {
                        xOffset = xOffset == 60 ? 0 : 60
                        yOffset = yOffset == 90 ? 0 : 90
                        verticalInset = verticalInset == 20 ? 0 : 20
                    }
                }
            
            BlobShapeWithInset(xOffset: xOffset, yOffset: yOffset, verticalInset: verticalInset)
                .padding()
        }
        .font(.title)
    }
}

private struct BlobShapeWithInset: Shape {
    var xOffset: CGFloat = 0.0
    var yOffset: CGFloat = 0.0
    var verticalInset: CGFloat = 0.0
    
    var animatableData: AnimatablePair<AnimatablePair<CGFloat, CGFloat>, CGFloat> {
        get { AnimatablePair(AnimatablePair(xOffset, yOffset), verticalInset) }
        set {
            xOffset = newValue.first.first
            yOffset = newValue.first.second
            verticalInset = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        // Point 1
        let startPoint = CGPoint(x: rect.width * 0.5, y: 0+verticalInset)
        
        var path = Path()
        path.move(to: startPoint)
        // Point 2
        path.addCurve(to: CGPoint(x: rect.width, y: rect.height/2),
                      control1: CGPoint(x: (rect.width * 0.85)+xOffset, y: 0+verticalInset), // a
                      control2: CGPoint(x: rect.width-xOffset, y: (rect.height * 0.1))) // b
        // Point 3
        path.addCurve(to: CGPoint(x: rect.width / 2, y: rect.height-verticalInset),
                      control1: CGPoint(x: rect.width+xOffset, y: (rect.height * 0.8)+yOffset), // c
                      control2: CGPoint(x: rect.width * 0.75, y: rect.height-verticalInset)) // d
        // Point 4
        path.addCurve(to: CGPoint(x: 0, y: rect.height * 0.7),
                      control1: CGPoint(x: (rect.width * 0.35)-xOffset, y: rect.height-verticalInset), // e
                      control2: CGPoint(x: 0, y: rect.height-yOffset)) // f
        // Point 5
        path.addCurve(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.3),
                      control1: CGPoint(x: 0, y: (rect.height * 0.4)+yOffset), // g
                      control2: CGPoint(x: (rect.width * 0.17)+xOffset, y: rect.height * 0.45)) // h
        // Back to Point 1
        path.addCurve(to: startPoint,
                      control1: CGPoint(x: (rect.width * 0.4)-xOffset, y: rect.height * 0.16), // i
                      control2: CGPoint(x: (rect.width * 0.35)-xOffset, y: 0+verticalInset)) // j
        
        return path
    }
}

struct AnimatablePair_ThreeValues_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePair_ThreeValues()
            .preferredColorScheme(.dark)
    }
}
