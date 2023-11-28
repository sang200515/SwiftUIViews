//
//  ContentView02.swift
//  SwiftUI_Components
//
//  Created by Em bé cute on 11/28/23.
//

import Foundation
import SwiftUI
private struct AnimatedStickyHeaderView: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            let user1 = User4(id: "1", firstName: "Olivia", lastName: "Johnson", profilePicture: "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", backgroundPicture: "https://images.pexels.com/photos/1064162/pexels-photo-1064162.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", postsCnt: 8, followersCnt: 671, LikesCnt: 1389)

            UserProfileHomeView(size: size, safeArea: safeArea, user: user1)
                .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    AnimatedStickyHeaderView()
}
fileprivate struct BookHome: View {
    
    
    
    var body: some View {
        VStack {
            Text("123")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
