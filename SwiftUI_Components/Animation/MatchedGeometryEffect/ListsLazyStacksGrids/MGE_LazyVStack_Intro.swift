// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

fileprivate struct MGE_LazyVStack_Intro: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    private var items = Data.getFruits()
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("LazyVStack")
            BannerText("Here is an example of using the LazyVStack.",
                       backColor: .green, textColor: .black)
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(items) { item in
                        HStack {
                            if item.id != selectedFruit?.id {
                                Image(item.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .matchedGeometryEffect(id: item.id, in: namespace)
                                    .frame(width: 50, height: 36)
                            } else {
                                Color.clear
                                    .frame(width: 50, height: 36)
                            }
                            
                            Text(item.name)
                                .font(.title)
                            
                            Spacer()
                        }
                        .padding()
                        .onTapGesture {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                                selectedFruit = item
                            }
                        }
                    }
                }
            }
            .disabled(selectedFruit != nil)
        }
        .blur(radius: selectedFruit != nil ? 3 : 0)
        .overlay(
            FruitDetailView(namespace: namespace, selectedFruit: $selectedFruit)
        )
    }
}

struct MGE_LazyVStack_Intro_Previews: PreviewProvider {
    static var previews: some View {
        MGE_LazyVStack_Intro()
    }
}
