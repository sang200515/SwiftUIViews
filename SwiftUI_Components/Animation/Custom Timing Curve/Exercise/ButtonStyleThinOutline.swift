
import SwiftUI

 struct ButtonStyleThinOutline: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(Color.white)
            .background(RoundedRectangle(cornerRadius: 15)
                            .fill(Color("Accent4"))
                            .opacity(0.1))
            .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("Accent4"), lineWidth: 0.7))
    }
}

struct ButtonStyleThinOutline_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Secondary4")
                .ignoresSafeArea()
            
            Button("Test How This Button Looks") { }
            .buttonStyle(ButtonStyleThinOutline())
        }
    }
}
