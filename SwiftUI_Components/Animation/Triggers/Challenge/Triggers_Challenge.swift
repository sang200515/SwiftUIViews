import SwiftUI

fileprivate struct Triggers_Challenge: View {
    @State private var expanded = true
    
    var body: some View {
        GeometryReader { gp in
            VStack(spacing: 8) {
                Text("Kluane National Park")
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: Alignment.leading)
                    .padding(.top, 40)
                    .padding(.leading, 30)
                    .animation(.easeOut, value: expanded)
                
                Image("KluaneNationalPark")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
                    .padding(expanded ? 20 : 0)
                    .frame(width: gp.size.width, height: expanded ? CGFloat(300) : 600)
                    .animation(.easeOut, value: expanded)
                
                Button(action: {
                    expanded.toggle()
                }, label: {
                    Image(systemName: "chevron.up")
                        .rotationEffect(Angle.degrees(expanded ? 180 : 0))
                })
                .animation(.easeOut, value: expanded)
                
                Text("Kluane National Park and Reserve is in the southwest of the Yukon, in Canada. It’s a vast wilderness of ice fields, forests and towering peaks like Mount Logan. Trails include the King’s Throne, which winds above Kathleen Lake to a dramatic view. The Alsek River travels through areas inhabited by grizzly bears.")
                    .padding(.horizontal)
                    .animation(.easeOut, value: expanded)
            }
        }
        .font(.title)
    }
}

struct Triggers_Challenge_Previews: PreviewProvider {
    static var previews: some View {
        Triggers_Challenge()
    }
}
