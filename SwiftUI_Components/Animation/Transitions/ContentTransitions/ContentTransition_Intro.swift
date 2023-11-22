import SwiftUI

 struct ContentTransition_Intro: View {
    @State private var selection = 1

    var body: some View {
        VStack(spacing: 24.0) {
            Label("Interpolate", systemImage: "figure.run")
                .font(selection==1 ? .largeTitle : .body)
                .frame(maxWidth: .infinity, alignment: selection==1 ? .center : .leading)
                .padding(selection==1 ? 64 : 8)
                .background(selection==1 ? Color.green.opacity(0.7) : .teal.opacity(0.7),
                            in: RoundedRectangle(cornerRadius: 8))
                .onTapGesture { selection = 1 }
                .contentTransition(.interpolate)
            Label("Opacity", systemImage: "figure.badminton")
                .font(selection==2 ? .largeTitle : .body)
                .frame(maxWidth: .infinity, alignment: selection==2 ? .center : .leading)
                .padding(selection==2 ? 64 : 8)
                .background(selection==2 ? Color.green.opacity(0.7) : .teal.opacity(0.7),
                            in: RoundedRectangle(cornerRadius: 8))
                .onTapGesture { selection = 2 }
                .contentTransition(.opacity)
            Label("Identity", systemImage: "figure.archery")
                .font(selection==3 ? .largeTitle : .body)
                .frame(maxWidth: .infinity, alignment: selection==3 ? .center : .leading)
                .padding(selection==3 ? 64 : 8)
                .background(selection==3 ? Color.green.opacity(0.7) : .teal.opacity(0.7),
                            in: RoundedRectangle(cornerRadius: 8))
                .onTapGesture { selection = 3 }
                .contentTransition(.identity)
        }
        .animation(.default, value: selection)
        .padding()
    }
}

struct ContentTransition_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ContentTransition_Intro()
    }
}
