// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

fileprivate struct MGE_List_SeparateDetailView: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    private var items = Data.getFruits()
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("List")
            BannerText("You can extract the detail view into a separate view.",
                       backColor: .green, textColor: .black)
            List(items) { item in
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
                    Text(item.name).font(.title)
                    Spacer()
                }
                .padding()
                .onTapGesture {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                        selectedFruit = item
                    }
                }
            }
            .listStyle(.plain)
            .disabled(selectedFruit != nil)
        }
        .blur(radius: selectedFruit != nil ? 3 : 0)
        .overlay(
            FruitDetailView(namespace: namespace, selectedFruit: $selectedFruit)
        )
    }
}

struct MGE_List_SeparateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MGE_List_SeparateDetailView()
    }
}

struct FruitDetailView: View {
    var namespace: Namespace.ID
    @Binding var selectedFruit: Item?
    
    var body: some View {
        if let fruitImage = selectedFruit?.imageName {
            VStack(spacing: 40) {
                Image(fruitImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: selectedFruit!.id, in: namespace)
                    .frame(width: 250)
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        selectedFruit = nil
                    }
                }) {
                    Text("Close")
                        .foregroundColor(.green)
                        .padding()
                        .background(Capsule().fill(Color.white))
                }
            }
            .padding(40)
            .background(RoundedRectangle(cornerRadius: 25)
                            .fill(Color.green)
                            .shadow(radius: 10))
        }
    }
}
