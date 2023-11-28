//6/23/19.
import SwiftUI

fileprivate struct Scrollview_Intro : View {
    @State private var names = ["Scott", "Mark", "Chris", "Sean", "Rod", "Meng", "Natasha", "Chase", "Evans", "Paul", "Durtschi", "Max"]
    var body: some View {
        ScrollView {
            ForEach(names, id: \.self) { name in
                HStack {
                    Text(name).foregroundColor(.primary)
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.green)
                    Spacer()
                }
                .padding()
                .background(Color.white.shadow(.drop(radius: 1, y: 1)),
                            in: RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 4)
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}


#Preview {
    Scrollview_Intro()
}
