//
//  HeaderView4.swift
//  AnimatedStickyProfile
//
//  Created by Cecilia Chen on 8/3/23.
//

import SwiftUI

struct HeaderView4: View {
    var user: User4
    var offsetY: CGFloat
    var safeArea: EdgeInsets
    var size: CGSize
    
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Rectangle()
                    .fill(.black.gradient)
                
                AsyncImage(url: URL(string: user.backgroundPicture)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .frame(width: UIScreen.main.bounds.width)
                .opacity(1 - progress)
                
                VStack(spacing: 15) {
                    GeometryReader {
                        let rect = $0.frame(in: .global)
                        let halfScaledHeight = (rect.height * 0.3) * 0.5
                        let midY = rect.midY
                        let bottomPadding: CGFloat = 15
                        let resizedOffsetY = (midY - (minimumHeaderHeight - halfScaledHeight - bottomPadding))
                        
                        AsyncImage(url: URL(string: user.profilePicture)) { image in
                                  image
                                .profileImageStyling(rect: rect)
                                .scaleEffect(1 - (progress * 0.7), anchor: .leading)
                                .offset(x: -(rect.minX - 15) * progress, y: -resizedOffsetY * progress)
                              } placeholder: {
                                  Color.gray
                                      .clipShape(Circle())
                              }
                    }
                    .padding(.top, 20)
                    .frame(width: headerHeight * 0.4, height: headerHeight * 0.4)
                    
                    Text("@" + user.firstName + " " + user.lastName)
                        .profileNameStyling()
                        .moveText(progress, headerHeight, minimumHeaderHeight)
                    
                    //MARK: - Posts/Followers/Likes Section
                    HStack {
                        Spacer()
                        VStack {
                            Text(String(user.postsCnt))
                            Text("Posts")
                                .font(.system(size: 12, weight: .regular, design: .default))
                        }
                        Spacer()
                        VStack {
                            Text(String(user.followersCnt))
                            Text("Followers")
                                .font(.system(size: 12, weight: .regular, design: .default))
                        }
                        Spacer()
                        VStack {
                            Text(String(user.LikesCnt))
                            Text("Likes")
                                .font(.system(size: 12, weight: .regular, design: .default))
                        }
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .medium, design: .default))
                    .opacity(1 - progress)
                }
                .padding(.top, safeArea.top)
                .padding(.bottom, 15)
            }
            .frame(height: (headerHeight + offsetY) < minimumHeaderHeight ? minimumHeaderHeight : (headerHeight + offsetY), alignment: .bottom)
            .offset(y: -offsetY)             // Sticking to the Top
        }
        .frame(height: headerHeight)
    }
}

private extension HeaderView4 {
    var minimumHeaderHeight: CGFloat {65 + safeArea.top}
    var headerHeight: CGFloat {(size.height * 0.3) + safeArea.top}
    var progress: CGFloat {max(min(-offsetY / (headerHeight - minimumHeaderHeight), 1), 0)}
}
private extension View {
    func moveText(_ progress: CGFloat, _ headerHeight: CGFloat, _ minimumHeaderHeight: CGFloat) -> some View {
        self
            .hidden()
            .overlay {
                GeometryReader { proxy in
                    let rect = proxy.frame(in: .global)
                    let midY = rect.midY
                    let halfScaledTextHeight = (rect.height * 0.85) / 2
                    let profileImageHeight = (headerHeight * 0.5)
                    let scaledImageHeight = profileImageHeight * 0.3
                    let halfScaledImageHeight = scaledImageHeight / 2
                    let vStackSpacing: CGFloat = 4.5
                    let resizedOffsetY = (midY - (minimumHeaderHeight - halfScaledTextHeight - vStackSpacing - halfScaledImageHeight))
                    
                    self
                        .scaleEffect(1 - (progress * 0.15))
                        .offset(y: -resizedOffsetY * progress)
                }
            }
    }
    
    func profileNameStyling() -> some View {
        self.modifier(ProfileNameModifier())
    }
}
