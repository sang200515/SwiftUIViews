// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

private struct AnimatableData_Intro: View {
    @State private var startingPoint: CGFloat = 0.0

    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("AnimatableData")
            SubtitleText("Introduction")
            BannerText("Use animatableData to tell SwiftUI which value you want animated.",
                       backColor: Color("Gold"))
            
            HStack(spacing: 16) {
                Button("Triangle") {
                    startingPoint = 200
                }
                Button("Trapezium") {
                    startingPoint = 100
                }
                Button("Square") {
                    startingPoint = 0
                }
            }
            
            RightAngleShape(startingPoint: startingPoint)
                .frame(width: 200, height: 200)
                .animation(.default, value: startingPoint)
        }
        .font(.title)
    }
}

struct RightAngleShape: Shape {
    var startingPoint: CGFloat = 0.0
    
    var animatableData: CGFloat {
        get { startingPoint }
        set { startingPoint = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: startingPoint, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct AnimatableData_Intro_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableData_Intro()
            .preferredColorScheme(.dark)
    }
}
