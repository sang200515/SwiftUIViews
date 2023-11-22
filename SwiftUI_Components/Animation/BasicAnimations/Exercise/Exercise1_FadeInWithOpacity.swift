//
//  Exercise1_FadeInWithOpacity.swift
//  SwiftUIAnimations
//
// 10/26/19.
import SwiftUI

private struct Exercise1_FadeInWithOpacity: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Exercise")
            SubtitleText("Fade In With Opacity")
            BannerText("Add the opacity modifier to the rectangle views and tell each rectangle that you want to animate any changes to its state.", backColor: .red, textColor: .white)
            
            Spacer()
            
            VStack(spacing: 1) {
                HStack(alignment: .bottom, spacing: 1) {
                    Rectangle()
                        .frame(width: 70, height: 35)
                        .opacity(change ? 1 : 0) // Transparent until change occurs
                        .animation(.default, value: change) // Use the default animation
                    Rectangle()
                        .frame(width: 35, height: 70)
                        .opacity(change ? 1 : 0)
                        .animation(.default, value: change)
                }.offset(x: -18)
                HStack(alignment: .top, spacing: 1) {
                    Rectangle()
                        .frame(width: 36, height: 72)
                        .opacity(change ? 1 : 0)
                        .animation(.default, value: change)
                    Rectangle()
                        .frame(width: 72, height: 36)
                        .opacity(change ? 1 : 0)
                        .animation(.default, value: change)
                }.offset(x: 18)
            }
            .foregroundColor(.red)
            
            Spacer()
            
            Button("Change") {
                change.toggle()
            }.padding(.bottom)
        }.font(.title)
    }
}

struct Exercise1_FadeInWithOpacity_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1_FadeInWithOpacity()
    }
}
