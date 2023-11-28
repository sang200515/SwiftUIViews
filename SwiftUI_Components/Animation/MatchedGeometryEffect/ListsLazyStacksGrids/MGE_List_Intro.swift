// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

fileprivate struct MGE_List_Intro: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    private var items = Data.getFruits()
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("List")
            BannerText("There are a few things you need to do to get matchedGeometryEffect working in Lists.",
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
            .listStyle(.plain)
            .disabled(selectedFruit != nil)
        }
        .blur(radius: selectedFruit != nil ? 3 : 0)
        .overlay(
            Group {
                // Detail View
                if selectedFruit != nil {
                    VStack(spacing: 40) {
                        Image(selectedFruit!.imageName)
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
        )
    }
}

struct MGE_List_Intro_Previews: PreviewProvider {
    static var previews: some View {
        MGE_List_Intro()
    }
}
