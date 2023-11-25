import SwiftUI

private struct CustomCarouselSlider: View {
    @State var currentIndex = 0
    let posts = [
        PostCarousel(postImage: "post1", starRating: 4),
        PostCarousel(postImage: "post2", starRating: 5),
        PostCarousel(postImage: "post3", starRating: 4),
        PostCarousel(postImage: "post4", starRating: 5),
    ]
    var body: some View {
        ZStack{
            TabView(selection: $currentIndex){
                ForEach(posts.indices,id: \.self){index in
                    GeometryReader{proxy in
                        Image(posts[index].postImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width,height: proxy.size.height)
                            .cornerRadius(0)
                            .blur(radius: 22)
                      }
                    .ignoresSafeArea()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
             .animation(.easeInOut, value: currentIndex)
            .overlay(
             LinearGradient(colors: [
             Color.black.opacity(0.2),
             Color.black.opacity(0.2),
             Color.black,
             Color.black.opacity(0.2),
               ], startPoint: .top, endPoint: .bottom)
        )
             .ignoresSafeArea()
            SnapCarousel(trailingSpace: 180, index: $currentIndex , items: posts){post in
               CardView(post: post)
            }
            .offset(y: getRect().height / 5)
       }
    }
    @ViewBuilder
    func CardView(post: PostCarousel)->some View{
        VStack(spacing:40){
            GeometryReader{proxy in
                Image(post.postImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .cornerRadius(35)
            }
            .frame(height: getRect().height / 2.2)
            .padding(.bottom, 13)
            
           HStack(spacing: 2){
                ForEach(1...5, id: \.self){ index in
                    Image(systemName: "star.fill")
                        .foregroundColor(index <= post.starRating ? .yellow : .gray)
                 }
                Text("(\(post.starRating).0)")
                    .foregroundColor(.white)
            }
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        CustomCarouselSlider()
    }
}
private extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}

private struct SnapCarousel<Content: View, T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>,items: [T], @ViewBuilder content: @escaping (T)->Content){
        
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    var body: some View{
        
        GeometryReader { proxy in
            
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustMenWidth = (trailingSpace / 2) - spacing
            
            HStack{
                ForEach(list){item in
                  content(item)
                      .frame(width: proxy.size.width - trailingSpace)
                      .offset(y: getOffset(item: item, width: width ))
              }
            }
            
            .padding(.horizontal,spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + ( currentIndex != 0 ? adjustMenWidth : 0) + offset)
            .gesture(
            DragGesture()
                .updating($offset, body: { value, out, _ in
                    out = value.translation.width
                })
                .onEnded({ value in
                    
                    let offsetX = value.translation.width
                    let progress = -offsetX / width
                    let roundIndex = progress.rounded()
                    currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    
                    currentIndex = index
                })
            
            
                .onChanged({ value in
                    
                    let offsetX = value.translation.width
                    let progress = -offsetX / width
                    let roundIndex = progress.rounded()
                    index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    
                })
            )
          }
        .animation(.easeInOut, value: offset == 0)
    }
    func getOffset(item: T, width: CGFloat)->CGFloat{
        
        let progress = ((offset < 0 ? offset : -offset) / width) * 60
        
        let topOffset = -progress < 60 ? progress : -(progress + 120)
        
        let previous = getIndex(item: item) - 1 == currentIndex ? topOffset : 0
        
        let next = getIndex(item: item) + 1 == currentIndex ? topOffset : 0
        let checkBetween = currentIndex >= 0 && currentIndex < list.count ? (getIndex(item: item) - 1 == currentIndex ? previous : next) : 0
        
        return getIndex(item: item) == currentIndex ? -60 - topOffset : checkBetween
    }
    
    
    
    func getIndex(item: T)->Int{
        let index = list.firstIndex { currentItem in
            return currentItem.id == item.id
        } ?? 0
        return index
    }
}

private struct PostCarousel: Identifiable{
    var id = UUID().uuidString
    var postImage: String
    var starRating: Int
}

