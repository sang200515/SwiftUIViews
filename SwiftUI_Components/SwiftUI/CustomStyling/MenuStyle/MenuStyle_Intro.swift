import SwiftUI

fileprivate struct MenuStyle_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("MenuStyle",
                       subtitle: "Introduction",
                       desc: "Use the menuStyle modifier to apply a pre-made style to your Menu views.",
                       back: .orange)
            
            Menu("Edit") {
                Button(action: {}) {
                    Text("Add color")
                    Image(systemName: "eyedropper.full")
                }
                Button(action: {}) {
                    Image(systemName: "circle.lefthalf.fill")
                    Text("Change contrast")
                }
            }
            .menuStyle(BorderMenuStyle(borderColor: Color.orange))
        }
        .tint(.orange)
        .font(.title)
    }
}

private struct BorderMenuStyle: MenuStyle {
    var borderColor: Color = Color.purple
    
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .padding()
            .background(RoundedRectangle(cornerRadius: 15)
                            .stroke(borderColor, lineWidth: 3))
    }
}

#Preview {
    MenuStyle_Intro()
}
