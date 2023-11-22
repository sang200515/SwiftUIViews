import SwiftUI

private struct Scrollview_Horizontal : View {
    var items = [Color.green, Color.blue, Color.purple, Color.pink,
                 Color.yellow, Color.orange]
    
    var body: some View {
        GeometryReader { gr in
            ScrollView(Axis.Set.horizontal, showsIndicators: true) {
                HStack {
                    ForEach(items, id: \.self) { item in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(item)
                            .frame(width: gr.size.width - 60,
                                   height: 200)
                    }
                }
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

#Preview {
    Scrollview_Horizontal()
}
