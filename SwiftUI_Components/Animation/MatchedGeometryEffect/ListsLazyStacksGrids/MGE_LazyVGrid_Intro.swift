// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

private struct MGE_LazyVGrid_Intro: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let fruits = Data.getFruits()
    
    var body: some View {
        VStack(spacing: 10.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("LazyVGrid")
            BannerText("Here is an example of using the LazyVGrid.",
                       backColor: .green, textColor: .black)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(fruits) { fruit in
                        ZStack {
                            RoundedRectangle(cornerRadius: 15).fill(Color.green)
                            
                            if fruit.id != selectedFruit?.id {
                                Button {
                                    withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                                        selectedFruit = fruit
                                    }
                                } label: {
                                    Image(fruit.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .matchedGeometryEffect(id: fruit.id, in: namespace)
                                        .frame(width: 70, height: 56)
                                }
                            }
                        }
                        .frame(height: 100)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
        .blur(radius: selectedFruit != nil ? 3 : 0)
        .disabled(selectedFruit != nil)
        .overlay(
            FruitDetailView(namespace: namespace, selectedFruit: $selectedFruit)
        )
    }
}

struct MGE_LazyVGrid_Intro_Previews: PreviewProvider {
    static var previews: some View {
        MGE_LazyVGrid_Intro()
    }
}
