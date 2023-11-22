//
//  Scope_WithAnimation_Sequencing_SameView.swift
//  SwiftUIAnimations
//
// 11/25/19.
import SwiftUI

private struct Scope_WithAnimation_Sequencing_SameView: View {
    @State private var expandMoreInfo = false
    @State private var showInfo = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("With Animation")
            SubtitleText("Sequencing with Parent/Child")
            BannerText("This solution works correctly when using withAnimation to animate the parent and the child views. Notice you need a second state variable for the second animation.", backColor: .yellow, textColor: .black)
            
            GeometryReader { gp in
                VStack(spacing: 15) {
                    HStack {
                        Image(systemName: "info.circle").padding(.horizontal)
                        Text("Login Help")
                        Spacer()
                    }.padding(.top)
                    
                    VStack(spacing: 10) {
                        Image(systemName: "slider.horizontal.3").font(.largeTitle)
                        Text("Appear after parent is done animating out.")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).opacity(0.1))
                    .padding(.horizontal)
                    .opacity(showInfo ? 1 : 0)
                }
                .padding(.trailing, 12)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.yellow).shadow(radius: 8))
                .foregroundColor(.black)
                .offset(x: expandMoreInfo ? 15 : (gp.frame(in: .global).width - 65),
                        y: expandMoreInfo ? 15 : (gp.frame(in: .global).height - 65))
                .onTapGesture {
                    withAnimation {
                        // Animation 1 on Parent
                        expandMoreInfo.toggle()
                    }
                    withAnimation(.default.delay(0.5)) {
                        // Animation 2 on Children
                        showInfo.toggle()
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .font(.title)
    }
}

struct Scope_WithAnimation_Sequencing_SameView_Previews: PreviewProvider {
    static var previews: some View {
        Scope_WithAnimation_Sequencing_SameView()
    }
}
