//
//  Path_CGPathToPath.swift
//  SwiftUI_Views
//
//11/23/19.
import SwiftUI

private struct Path_CGPathToPath: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Path", subtitle: "Using UIKit CGPath", desc: "You may want to use existing UIKit path objects and functions that SwiftUI doesn't have yet. SwiftUI's Path has an initializer that accepts a Core Graphics Path.",
                       back: .purple, textColor: .white)
                .layoutPriority(1)
            
            RoundedCorners(cornerRadius: 20, corners: [.topRight, .bottomRight])
                .fill(Color.purple)
                .frame(height: 80)
                .padding([.trailing], 30)
            
            RoundedCorners(cornerRadius: 40, corners: [.topRight, .bottomLeft])
                .fill(Color.purple)
                .padding(.horizontal, 100)
            
            Spacer()
            
            VStack {
                HStack {
                    Image(systemName: "info.circle").padding(.leading)
                    Text("More info")
                    Spacer()
                }
                .padding(.top)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 75)
            .foregroundColor(.white)
            // Use the custom Shape as the background
            .background(RoundedCorners(cornerRadius: 30, corners: [.topLeft])
            .fill(Color.purple))
            .padding(.leading, 50)
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct RoundedCorners: Shape {
    var cornerRadius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath) // Path can accept Core Graphic Paths
    }
}

struct Path_CGPathToPath_Previews: PreviewProvider {
    static var previews: some View {
        Path_CGPathToPath()
    }
}
