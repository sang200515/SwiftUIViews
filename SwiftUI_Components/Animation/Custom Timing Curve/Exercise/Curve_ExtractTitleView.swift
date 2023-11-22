import SwiftUI

 struct TitleView2: View {
    var body: some View {
        VStack {
            Text("Workout Pro")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding(.top, 40)
            Spacer()
        }
    }
}

struct Curve_ExtractTitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView2()
    }
}
