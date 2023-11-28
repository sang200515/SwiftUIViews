//
//  AnimatedCarouselView.swift
//  SwiftUI_Components
//
//  Created by Em bé cute on 11/27/23.
//

import Foundation
import SwiftUI

fileprivate struct AnimatedCarouselView: View {
    private let  movies: [Movie1] = [
        Movie1(movieTitle: "", artwork: "BG2"),
        Movie1(movieTitle: "", artwork: "BG1"),
        Movie1(movieTitle: "", artwork: "BG4"),
        Movie1(movieTitle: "", artwork: "BG3"),
    ]
    @State var currentTab: Tab1 = .House
    @Namespace var animation
    @State var currentIndex: Int = 0
    var body: some View {
        VStack(spacing: 15){
            HeaderView()
            SearchBar()
            
            Text("Welcome To Order Cake")
                .font(.title3)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 15)
            CustomCarousel(index: $currentIndex, Items: movies, cardPadding: 150, id: \.id) { movie,cardsize  in
                
                Image(movie.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardsize.width, height: cardsize.height)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
            .padding(.horizontal, -15)
            .padding(.vertical)
            TabBar()
        }
        .padding([.horizontal,.top], 15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background{
            
            GeometryReader{proxy in
                let size = proxy.size
                TabView(selection: $currentIndex){
                    ForEach(movies.indices, id: \.self){index in
                        Image(movies[index].artwork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .clipped()
                        
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentIndex)
                Rectangle()
                    .fill(.ultraThinMaterial)
                
                LinearGradient(colors: [
                    Color.black.opacity(0.3)
                    
                ], startPoint: .top, endPoint: .bottom)
            }
            .ignoresSafeArea()
        }
        
    }
    @ViewBuilder
    func TabBar()->some View{
        HStack(spacing: 0){
            ForEach(Tab1.allCases, id: \.rawValue){tab in
                VStack(spacing: -2){
                    Image(tab.rawValue)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 29)
                        .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.6))
                    
                    if currentTab == tab{
                        Circle()
                            .fill(.white)
                            .frame(width: 5, height: 5)
                            .offset(y: 10)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut){currentTab = tab}
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    @ViewBuilder
    func SearchBar()->some View{
        HStack(spacing: 15){
            Image(systemName: "magnifyingglass")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 28, height: 28)
                .foregroundColor(.gray)
            
            TextField("Search", text: .constant(""))
                .padding(.vertical, 10)
            Image(systemName: "mic")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 28, height: 28)
                .foregroundColor(.gray)
            
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.white.opacity(0.12))
        )
        .padding(.top, 20)
    }
    @ViewBuilder
    func HeaderView()->some View{
        HStack{
            VStack(alignment: .leading, spacing: 6){
                (Text("Hi")
                    .fontWeight(.semibold) +
                 Text("Metin"))
                .font(.title2)
                
                Text("Welcome")
                    .font(.callout)
                    .foregroundColor(.gray)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Button{
            }label: {
                Image("Logo")
                    .resizable().aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
            }
        }
    }
    
}

private struct CustomCarousel<Content: View,Item,ID> : View where Item: RandomAccessCollection, ID: Hashable, Item.Element: Equatable {
    
    var content: (Item.Element,CGSize)->Content
    var id: KeyPath<Item.Element,ID>
    var spacing: CGFloat
    var cardPadding: CGFloat
    var items: Item
    
    @Binding var index: Int
    
    init(index: Binding<Int>, Items: Item, spacing: CGFloat = 30, cardPadding: CGFloat = 80, id: KeyPath<Item.Element, ID>,@ViewBuilder content: @escaping (Item.Element,CGSize) -> Content){
        
        self.content = content
        self.id = id
        self._index = index
        self.spacing = spacing
        self.cardPadding = cardPadding
        self.items = Items
    }
    
    @GestureState var translation: CGFloat = 0
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    @State var currentIndex: Int = 0
    @State var rotation: Double = 0
    
    
    var body: some View {
        GeometryReader{proxy in
            let size = proxy.size
            
            let cardWidth = size.width - (cardPadding - spacing)
            LazyHStack(spacing: spacing){
                
                ForEach(items, id: id){movie in
                    let index = indexOf(item: movie)
                    content(movie,CGSize(width: size.width - cardPadding, height: size.height))
                        .rotationEffect(.init(degrees: Double(index) * 5),anchor: .bottom)
                        .rotationEffect(.init(degrees: rotation),anchor: .bottom)
                        .offset(y: offsetY(index: index, cardWidth: cardWidth))
                        .frame(width: size.width - cardPadding, height: size.height)
                        .contentShape(Rectangle())
                }
            }
            .padding(.horizontal,spacing)
            .offset(x: limitScroll())
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 5)
                    .updating($translation, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onChanged{onChanged(value: $0, cardWidth: cardWidth)}
                    .onEnded{onEnded(value: $0, cardWidth: cardWidth)}
            )
        }
        
        .padding(.top, 60)
        .onAppear{
            
            let extraSpace = (cardPadding / 2) - spacing
            offset = extraSpace
            lastStoredOffset = extraSpace
            
        }
        .animation(.easeInOut, value: translation == 0)
    }
    func offsetY(index: Int, cardWidth: CGFloat)->CGFloat{
        let progress = ((translation < 0 ? translation : -translation) / cardWidth) * 60
        let yoffset = -progress < 60 ? progress : -(progress + 120)
        let previous = (index - 1) == self.index ? (translation < 0 ? yoffset : -yoffset) : 0
        let next = (index + 1) == self.index ? (translation < 0 ? -yoffset : yoffset) : 0
        
        let In_Between = (index - 1) == self.index ? previous : next
        
        return index == self.index ? -60 - yoffset : In_Between
        
    }
    
    
    func indexOf(item: Item.Element)->Int{
        let array = Array(items)
        if let index = array.firstIndex(of: item){
            
            return index
        }
        return 0
    }
    func limitScroll()->CGFloat{
        let extraSpace = (cardPadding / 2) - spacing
        if index == 0 && offset > extraSpace {
            
            return extraSpace + (offset / 4)
        }else if index == items.count - 1 && translation < 0{
            return offset - (translation / 2)
        }else{
            return offset
        }
        
    }
    func onChanged(value: DragGesture.Value,cardWidth: CGFloat){
        let translationX = value.translation.width
        offset = translationX + lastStoredOffset
        
        let progress = offset / cardWidth
        rotation = progress * 5
    }
    func onEnded(value: DragGesture.Value,cardWidth: CGFloat){
        
        var _index = (offset / cardWidth).rounded()
        _index = max(-CGFloat(items.count - 1), _index)
        _index = min(_index, 0)
        
        currentIndex = Int(_index)
        
        index = -currentIndex
        
        withAnimation(.easeInOut(duration: 0.25)){
            
            let extraSpace = (cardPadding / 2) - spacing
            
            offset = (cardWidth * _index) + extraSpace
            
            let progress = offset / cardWidth
            
            rotation = (progress * 5).rounded() - 1
        }
        lastStoredOffset = offset
    }
}


import SwiftUI

private enum Tab1: String, CaseIterable {
    case House = "house"
    case Explore = "explore"
    case Notification = "notification"
    case Person = "person"
}
private struct Movie1: Identifiable,Equatable {
    var id = UUID().uuidString
    var movieTitle: String
    var artwork: String
}



struct AnimatedCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedCarouselView()
            .preferredColorScheme(.dark)
    }
}
