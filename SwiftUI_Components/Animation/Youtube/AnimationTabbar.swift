//
//  AnimationTabbarView.swift
//  SwiftUI_Components
//
//  Created by Em bé cute on 11/27/23.
//

import SwiftUI

fileprivate struct AnimationTabarView: View {
    
    enum Tab: String, CaseIterable {
        case House = "house"
        case Explore = "explore"
        case Person = "person"
    }
    @State var currentTab: Tab = .House
    @Namespace var animation
    
    var body: some View {
        TabBar()
    }
    @ViewBuilder
    func TabBar()-> some View{
        HStack(spacing: 0){
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                VStack(spacing: -2){
                    Image(tab.rawValue)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 29)
                        .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.6))
                    
                    if currentTab == tab{
                        Circle()
                            .fill(.white)
                            .frame(width: 5, height: 5)
                            .offset(y: 10)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut){currentTab = tab}
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

struct AnimationTabarView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTabarView()
            .preferredColorScheme(.dark)
    }
}
