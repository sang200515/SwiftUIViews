//
//  ViewModifiers.swift
//  AnimatedStickyProfile
//
//  Created by Cecilia Chen on 8/3/23.
//

import SwiftUI



struct ProfileNameModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .medium, design: .default))
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

extension Image {
    func profileImageStyling(rect: CGRect) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .frame(width: rect.width, height: rect.height)
            .overlay(
                Circle()
                    .stroke(
                        LinearGradient(colors: [.red, .purple, .red, .orange, .yellow, .orange],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing), lineWidth: 3
                    )
                    .frame(width: rect.width + 18, height: rect.height + 18)
            )
    }
}
