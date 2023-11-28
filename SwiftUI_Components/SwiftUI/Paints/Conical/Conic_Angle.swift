import SwiftUI

fileprivate struct Conic_Angle: View {
    let gradient = Gradient(colors: [.green, .blue])
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Conic Gradient",
                       subtitle: "Angle",
                       desc: "Use the angle parameter to set where the first color starts.")
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.conicGradient(gradient, center: .center,
                                                    angle: .degrees(45)))
                    .overlay(Text("45°"), alignment: .top)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.conicGradient(gradient, center: .center,
                                                    angle: .degrees(90)))
                    .overlay(Text("90°"), alignment: .top)
            }
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.conicGradient(gradient, center: .center,
                                                    angle: .degrees(180)))
                    .overlay(Text("180°"), alignment: .top)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.conicGradient(gradient, center: .center,
                                                    angle: .degrees(270)))
                    .overlay(Text("270°"), alignment: .top)
            }
        }
        .font(.title)
    }
}

struct Conic_Angle_Previews: PreviewProvider {
    static var previews: some View {
        Conic_Angle()
    }
}
