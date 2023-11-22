import SwiftUI

private struct MGE_WhatCouldGoWrong_PositioningProblem: View {
    @State private var showView2 = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Positioning Problems")
            BannerText("Here's an example of how a positioning modifier can also create unexpected results.", backColor: .green, textColor: .black)
            Spacer()
            
            if showView2 {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.green)
                    .overlay(Text("View 2"))
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .onTapGesture { showView2.toggle() }
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.green)
                    .overlay(Text("View 1"))
                    .offset(x: -130)
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .frame(width: 100, height: 100)
                    .onTapGesture { showView2.toggle() }
            }
        }
        .animation(.default, value: showView2)
        .font(.title)
    }
}

struct MGE_WhatCouldGoWrong_PositioningProblem_Previews: PreviewProvider {
    static var previews: some View {
        MGE_WhatCouldGoWrong_PositioningProblem()
    }
}
