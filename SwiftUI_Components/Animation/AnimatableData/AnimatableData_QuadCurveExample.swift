// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

private struct AnimatableData_QuadCurveExample: View {
    @State private var presentingSheet = false
    @State private var curveOffset = -40.0
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("AnimatableData")
            SubtitleText("On a QuadCurve Shape")
            BannerText("An example using animatableData with a quad curve shape to create a bounce effect on a sheet.",
                       backColor: Color("Gold"))
            
            Button("Show Sheet") {
                presentingSheet = true
            }
        }
        .font(.title)
        .sheet(isPresented: $presentingSheet) {
            // onDismiss - reset the curve
            curveOffset = -40.0
        } content: {
            VStack {
                QuadCurveRectangle(curveOffset: curveOffset)
                    .fill(Color("Gold"))
                    .frame(height: 100)
                    .overlay(Text("Animate Curve").font(.largeTitle))
                    .onAppear {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.2).delay(0.2)) {
                            curveOffset = 0.0
                        }
                    }
                Spacer()
            }
        }
    }
}

struct AnimatableData_QuadCurveExample_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableData_QuadCurveExample()
            .preferredColorScheme(.dark)
    }
}

struct QuadCurveRectangle: Shape {
    // How far up or down you want the curve to extend
    var curveOffset: CGFloat = 0.0
    
    var animatableData: CGFloat {
        get { curveOffset }
        set { curveOffset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.maxY + curveOffset))
        path.addLine(to: CGPoint(x: 0, y: 0))
        return path
    }
}
