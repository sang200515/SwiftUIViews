//
//  SkeletonView.swift
//  SwiftUI_Components
//
//  Created by Em bé cute on 11/27/23.
//
import SwiftUI

fileprivate struct SkeletonViewShimmerView: View {
    @State private var shimmering = false
    
    let streamSnow = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    let streamGray = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
    
    var body: some View {
        NavigationView{
            VStack {
                ForEach(0 ..< 8) { item in
                    HStack {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 54))
                        
                        VStack(alignment: .leading) {
                            Text("TplaceholderTpla")
                            Text("So cool")
                        }
                        .font(.title)
                    }
                    .foregroundStyle(
                        .linearGradient(
                            colors: [Color(streamSnow), Color(streamGray)],
                            startPoint: .leading,
                            endPoint: shimmering ? .trailing : .leading
                        )
                    )
                    .redacted(reason: .placeholder)
                }
                .padding()
                .offset(x: -50, y: 100)
                .animation(.easeOut(duration: 1.5).repeatForever(autoreverses: false), value: shimmering)
                .onAppear {
                    shimmering.toggle()
                }
            }
            .navigationTitle("Animated PlaceHolder")
        }
    }
}

struct SkeletonViewShimmerView_Previews: PreviewProvider {
    static var previews: some View {
        SkeletonViewShimmerView()
            .preferredColorScheme(.dark)
    }
}
