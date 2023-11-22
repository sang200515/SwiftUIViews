// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

private struct AnimatablePair_BlobExample: View {
    @State private var xOffset: CGFloat = 0.0
    @State private var yOffset: CGFloat = 0.0

    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("AnimatablePair")
            SubtitleText("Introduction")
            BannerText("Use animatablePair when you want to animate more than one value at a time.",
                       backColor: Color("Gold"))
            
                Button("Animate") {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.2)) {
                        xOffset = xOffset == 60 ? 0 : 60
                        yOffset = yOffset == 90 ? 0 : 90
                    }
                }
            
            BlobShape2(xOffset: xOffset, yOffset: yOffset)
                .padding()
        }
        .font(.title)
    }
}

struct BlobShape2: Shape {
    var xOffset: CGFloat = 0.0
    var yOffset: CGFloat = 0.0
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(xOffset, yOffset) }
        set {
            xOffset = newValue.first
            yOffset = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        // Point 1
        let startPoint = CGPoint(x: rect.width * 0.5, y: 0)
        
        var path = Path()
        path.move(to: startPoint)
        // Point 2
        path.addCurve(to: CGPoint(x: rect.width, y: rect.height/2),
                      control1: CGPoint(x: (rect.width * 0.85)+xOffset, y: 0), // a
                      control2: CGPoint(x: rect.width-xOffset, y: (rect.height * 0.1))) // b
        // Point 3
        path.addCurve(to: CGPoint(x: rect.width / 2, y: rect.height),
                      control1: CGPoint(x: rect.width+xOffset, y: (rect.height * 0.8)+yOffset), // c
                      control2: CGPoint(x: rect.width * 0.75, y: rect.height)) // d
        // Point 4
        path.addCurve(to: CGPoint(x: 0, y: rect.height * 0.7),
                      control1: CGPoint(x: (rect.width * 0.35)-xOffset, y: rect.height), // e
                      control2: CGPoint(x: 0, y: rect.height-yOffset)) // f
        // Point 5
        path.addCurve(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.3),
                      control1: CGPoint(x: 0, y: (rect.height * 0.4)+yOffset), // g
                      control2: CGPoint(x: (rect.width * 0.17)+xOffset, y: rect.height * 0.45)) // h
        // Back to Point 1
        path.addCurve(to: startPoint,
                      control1: CGPoint(x: (rect.width * 0.4)-xOffset, y: rect.height * 0.16), // i
                      control2: CGPoint(x: (rect.width * 0.35)-xOffset, y: 0)) // j
        
        return path
    }
}

struct AnimatablePair_BlobExample_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePair_BlobExample()
            .preferredColorScheme(.dark)
    }
}

