//
//  Home.swift
//  BookPageFlipAnimation
//
//  Created by Cecilia Chen on 8/4/23.
//

import SwiftUI
private let sampleBooks:[BookModel] = [
    .init(title: "Summer Advanture", image: "Summer Adventure", author: "Phyllis Schwaiger"),
    .init(title: "Our Butterfly", image: "Our Butterfly", author: "Olivia Wilson"),
    .init(title: "The Beautiful Night", image: "The Beautiful Night", author: "Hannah Morales"),
    .init(title: "Walk With Moths", image: "Walk With Moths", author: "Juliana Silva")
]
fileprivate struct BookHome: View {
    
    
    @State var currentBook: BookModel = sampleBooks.first!
    
    var body: some View {
        VStack {
            BookHeaderView()
            BookSliderView(currentBook: $currentBook)
            SliderBottomView(currentBook: $currentBook)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    BookHome()
}


private struct BookSliderView: View {
    @Binding var currentBook: BookModel
    
    var body: some View {
        TabView(selection: $currentBook) {
            ForEach(sampleBooks) { book in
                BookView(book: book)
                    .tag(book)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .background {
            Image(.background1)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
}

private struct BookView: View {
    let book: BookModel
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            let rect = $0.frame(in: .global)
            let minX = (rect.minX - 50) < 0 ? (rect.minX - 50) : -(rect.minX - 50)
            let progress = (minX) / rect.width
            let rotation = progress * 45
            
            ZStack {
                IsometricView(depth: 10) {
                    Color.white
                } bottom: {
                    Color.white
                } side: {
                    Color.white
                }
                .frame(width: size.width/1.2, height: size.height/1.5)
                .shadow(color: .black.opacity(0.12), radius: 5, x: 15, y: 8)
                .shadow(color: .black.opacity(0.1), radius: 6, x: -10, y: -8)
                
                
                Image(book.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width/1.2, height: size.height/1.5)
                    .clipped()
                    .shadow(color: .black.opacity(0.1), radius: 6, x: 10, y: 8)
                    .rotation3DEffect(
                        .init(degrees: rotation), axis: (x:0, y: 1, z: 0), anchor: .leading, perspective: 1)
                    .modifier(CustomProjection(value: 1+(-progress < 1 ? progress : -1.0)))
                
            }
            .offset(x: indexOf(book: book) > 0 ? -(progress * 45) : 0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(.horizontal, 50)
    }
    func indexOf(book: BookModel) -> Int {
        if let index = sampleBooks.firstIndex(of: book) {
            return index
        }
        return 0
    }
}

private  struct BookHeaderView: View {
    var body: some View {
        HStack(spacing: 15) {
            Text("Top Rated")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.black.opacity(0.7))
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(15)
    }
}

// MARK: Animatable Projection Transform
private struct CustomProjection: GeometryEffect{
    var value: CGFloat
    
    var animatableData: CGFloat{
        get{
            return value
        }
        set{
            value = newValue
        }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        var transform = CATransform3DIdentity
        transform.m11 = (value == 0 ? 0.0001 : value)
        return .init(transform)
    }
}

// MARK: Custom View
private  struct IsometricView<Content: View,Bottom: View,Side: View>: View{
    var content: Content
    var bottom: Bottom
    var side: Side
    
    // MARK: Isometric Depth
    var depth: CGFloat
    
    init(depth: CGFloat,@ViewBuilder content: @escaping()->Content,@ViewBuilder bottom: @escaping()->Bottom,@ViewBuilder side: @escaping()->Side) {
        self.depth = depth
        self.content = content()
        self.bottom = bottom()
        self.side = side()
    }
    
    var body: some View{
        Color.clear
        // FOR GEOMETRY TO TAKE THE SPECIFIED SPACE
            .overlay {
                GeometryReader{
                    let size = $0.size
                    
                    ZStack{
                        content
                        
                        bottom
                            .scaleEffect(y: depth,anchor: .bottom)
                            .frame(height: depth,alignment: .bottom)
                        // MARK: Dimming Content With Blur
                            .overlay(content: {
                                Rectangle()
                                    .fill(.black.opacity(0.25))
                                    .blur(radius: 2.5)
                            })
                            .clipped()
                        // MARK: Applying Transforms
                        // MARK: Your Custom Projection Values
                            .projectionEffect(.init(.init(a: 1, b: 0, c: 1, d: 1, tx: 0, ty: 0)))
                            .offset(y: depth)
                            .frame(maxHeight: .infinity,alignment: .bottom)
                        
                        side
                            .scaleEffect(x: depth,anchor: .trailing)
                            .frame(width: depth,alignment: .trailing)
                            .overlay(content: {
                                Rectangle()
                                    .fill(.black.opacity(0.25))
                                    .blur(radius: 2.5)
                            })
                            .clipped()
                        // MARK: Applying Transforms
                        // MARK: Your Custom Projection Values
                            .projectionEffect(.init(.init(a: 1, b: 1, c: 0, d: 1, tx: 0, ty: 0)))
                        // MARK: Change Offset, Transform Values for your Wish
                            .offset(x: depth)
                            .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                    .frame(width: size.width, height: size.height)
                }
            }
    }
}
private  struct SliderBottomView: View {
    @Binding var currentBook: BookModel
    func indexOf(book: BookModel) -> Int {
        if let index = sampleBooks.firstIndex(of: book) {
            return index
        }
        return 0
    }
    var body: some View {
        VStack {
            GeometryReader {
                let size = $0.size
                
                HStack(spacing: 0) {
                    ForEach(sampleBooks) { book in
                        let index = indexOf(book: book)
                        let currentIndex = indexOf(book: currentBook)
                        
                        VStack(alignment: .leading, spacing: 18) {
                            Text(book.title)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.black.opacity(0.7))
                                .offset(x: CGFloat(currentIndex) * -(size.width + 30))
                                .opacity(currentIndex == index ? 1 : 0)
                                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(currentIndex < index ? 0.1 : 0), value: currentIndex == index)
                            
                            Text("By \(book.author)")
                                .font(.callout)
                                .foregroundColor(.gray)
                                .offset(x: CGFloat(currentIndex) * -(size.width + 30))
                                .opacity(currentIndex == index ? 1 : 0)
                                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(currentIndex < index ? 0.1 : 0), value: currentIndex == index)
                            
                        }
                        .frame(width: size.width+30, alignment: .leading)
                    }
                }
            }
            .padding(.horizontal, 15)
            .frame(height: 100)
            .padding(.bottom, 10)
            
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(.gray.opacity(0.4))
                
                GeometryReader {
                    let size = $0.size
                    Capsule()
                        .fill(Color("OrangeIndicator"))
                        .frame(width: CGFloat(indexOf(book: currentBook)) / CGFloat(sampleBooks.count - 1) * size.width)
                        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.75, blendDuration: 0.75), value: currentBook)
                }
            }
            .frame(height: 4)
            .padding(.top, 10)
            .padding([.horizontal, .bottom], 15)
        }
    }
}

private  struct BookModel: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let title: String
    let image: String
    let author: String
}

