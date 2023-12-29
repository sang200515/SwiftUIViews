//
//  GlassmorphismView.swift
//  SwiftUI_Components
//
//  Created by Em bé cute on 12/3/23.
//

import Foundation
import SwiftUI

struct ScrollTransitionView: View {
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 10){
                ForEach(1..<30,id: \.self){ index in
                    Text("Cell \(index)")
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                        .overlay(.white.opacity(0.5), in: RoundedRectangle(cornerRadius: 10).stroke(style: .init()))
                        .padding(.horizontal,20)
                        .scrollTransition { emptyVisualEffect, scrollTransitionPhase in
                            emptyVisualEffect.scaleEffect(scrollTransitionPhase.isIdentity ? 1 : 0.8)
                        }
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [.pink, .green,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    ScrollTransitionView()
}

//
//  ContentView.swift
//  ScrollFromBottom
//
//  Created by Ganesh on 02/08/23.
//



import SwiftUI

struct ScrollFromBottom: View {
    @State private var items: [Int] = Array(0..<50)

    var body: some View {
        NavigationView {
            ScrollView {
                ScrollViewReader { proxy in
                    VStack(spacing: 10) {
                        ForEach(items, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .foregroundColor(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                                .id(index)
                        }
                    }
                    .padding(12)
                    .onChange(of: items.count) { _ in
                        DispatchQueue.main.async {
                            withAnimation {
                                proxy.scrollTo(items.count - 1, anchor: .bottom)
                            }
                        }
                    }
                }
            }
            .navigationBarItems(trailing:
                Button("Add Item") {
                    items.append(items.count)
                }
            )
            .navigationBarTitle(Text("ScrollFromBottom"))
        }
    }
}
#Preview {
    ScrollFromBottom()
}
