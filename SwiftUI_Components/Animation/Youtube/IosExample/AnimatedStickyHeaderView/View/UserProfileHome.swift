//
//  Home.swift
//  AnimatedStickyProfile
//
//  Created by Cecilia Chen on 8/3/23.
//

import SwiftUI

struct UserProfileHomeView: View {
    var size: CGSize
    var safeArea: EdgeInsets
    var user: User4

    @State private var offsetY: CGFloat = 0
    
    @State var tabSelection: Int = 0

    
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    HeaderView4(user: user, offsetY: offsetY, safeArea: safeArea, size: size)
                        .zIndex(1000)
                    
                    TabBarView4(currentTab: self.$tabSelection, tabBarOptions: ["Posts", "Collects", "Likes & Hist"])
                        .padding(.leading, -30)
                        .padding(.top, 15)
                    
                    if tabSelection == 0 {
                        PostsCollection()
                    } else if tabSelection == 1{
                        ColletCollection()
                    } else {
                        LikesCollection()
                    }
                    
                }
                .id("SCROLLVIEW")
                .background {
                    ScrollDetector { offset in
                        offsetY = -offset
                    } onDraggingEnd: { offset, velocity in
                        let headerHeight = (size.height * 0.3) + safeArea.top
                        let minimumHeaderHeight = 65 + safeArea.top
                        
                        let targetEnd = offset + (velocity * 45)
                        if targetEnd < (headerHeight - minimumHeaderHeight) && targetEnd > 0 {
                            withAnimation(.interactiveSpring(response: 0.55, dampingFraction: 0.65, blendDuration: 0.65)) {
                                scrollProxy.scrollTo("SCROLLVIEW", anchor: .top)
                            }
                        }
                    }
                }
            }
        }
    }
}
