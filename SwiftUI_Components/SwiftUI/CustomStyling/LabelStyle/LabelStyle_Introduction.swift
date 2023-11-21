

import SwiftUI

private struct LabelStyle_Introduction: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("LabelStyle",
                       subtitle: "Introduction",
                       desc: "You can implement your own style for the Label and adjust where the icon and text are in relation to each other.")

            Text("Before")

            Label(
                title: { Text("Here is my Label Text") },
                icon: { Image(systemName: "star.circle.fill") })
            
            Divider()
            
            Text("After")
            
            Label(
                title: { Text("Here is my Label Text") },
                icon: { Image(systemName: "star.circle.fill") })
                .labelStyle(VerticalLabelStyle(backColor: .yellow))
        }
        .font(.title)
    }
}

private struct VerticalLabelStyle: LabelStyle {
    var backColor: Color = Color.clear
    
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(spacing: -20) {
            configuration.icon
                .padding()
            configuration.title
                .padding()
        }
        .background(
            VStack(spacing: -35) {
                Circle()
                    .fill(backColor)
                RoundedRectangle(cornerRadius: 10)
                    .fill(backColor)
            }
        )
    }
}

#Preview {
    LabelStyle_Introduction()
}
