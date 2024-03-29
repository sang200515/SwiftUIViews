import SwiftUI

fileprivate struct Text_TextCase: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Text",
                       subtitle: "Upper/Lower Case",
                       desc: "You can make letters all upper or lower case.",
                       back: .green, textColor: .white)
            Text("This is the TEST text - 123")
            
            DescView(desc: "lowercase", back: .green, textColor: .white)
            Text("This is the TEST text - 123")
                .textCase(.lowercase)
            
            DescView(desc: "uppercase", back: .green, textColor: .white)
            Text("This is the TEST text - 123")
                .textCase(.uppercase)
        }
        .font(.title)
    }
}

struct Text_TextCase_Previews: PreviewProvider {
    static var previews: some View {
        Text_TextCase()
    }
}
