//
//  AnimatedStickyHeader.swift
//  SwiftUI_Components
//
//  Created by Em bé cute on 11/25/23.
//

import SwiftUI

fileprivate struct AnimatedStickyHeader: View {
    
    let safeArea: EdgeInsets
    let size: CGSize
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 10){
                ImageView()
                
                VStack(spacing: 10){
                    Text("Popular")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    TextView()
                }
            }
        }
        .coordinateSpace(name: "SCROLL")
    }
    @ViewBuilder
    func ImageView()->some View{
        
        let height = size.height * 0.45
        
        GeometryReader{ proxy in
            
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            
            Image("img2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                .clipped()
                .overlay(content: {
                    ZStack(alignment: .bottom){
                        Rectangle()
                            .fill(.linearGradient(colors: (0...5).map { Color.black.opacity(Double($0) * 0.2 - progress) }, startPoint: .top, endPoint: .bottom))
                        
                        VStack(spacing: 0){
                            Text("Chocolate\nCake Recipe")
                                .font(.system(size: 45))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                            Text("10K Monthly Viewers")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding(.top, 15)
                        }.opacity(1 + (progress > 0 ? -progress : progress)).padding(.bottom, 55).offset(y: minY < 0 ? minY : 0)
                        
                    }
                    
                })
                .offset(y: -minY)
        }.frame(height: height + safeArea.top)
    }
    
    @ViewBuilder
    func TextView()->some View{
        VStack(spacing: 25){
            Text("Chocolate cake is a delicious and popular dessert, usually made using cocoa powder or melted chocolate. Here are a few facts about chocolate cake:Ingredients:** The basic ingredients for making chocolate cake usually include flour, sugar, eggs, butter or oil, milk, baking powder or baking soda, and cocoa powder. Melted chocolate can also be used in some recipes.Preparation:** Usually chocolate cake recipes involve a preparation process in the form of combining dry ingredients first, then adding liquid ingredients and mixing. This mixture is mixed until a homogeneous consistency is obtained.Baking:** The cake dough is poured into a cake tin, which is usually greased and floured. It is baked in the oven at a certain temperature. The cooking time may vary depending on the recipe and the temperature of the oven.Decoration:** Chocolate cakes are usually decorated by sprinkling chocolate sauce, cream, ice cream or powdered sugar on them. It is also possible to decorate with ingredients such as chocolate chips, fruit slices or nuts.Varieties:** Chocolate cakes can be of different types. For example, there are varieties such as plain chocolate cake, chocolate chip cake, white chocolate cake or chocolate cake with nuts.Presentation:** Chocolate cakes are usually served sliced. Sliced cakes are usually consumed together with tea, coffee or hot chocolate.Chocolate cake is a delicious recipe that is preferred as a sweet snack at various events or special occasions. You can find recipes that suit your own taste buds or create personalized chocolate cakes by trying them out.")
                .font(Font.custom("Iowan Old Style", size: 20))
                .frame(width: 368, alignment: .leading)
                .offset(y: -70)
        }.padding(15)
    }
}

struct AnimatedStickyHeader_Previews: PreviewProvider {
    static var previews: some View {
              GeometryReader{
                  let safeArea = $0.safeAreaInsets
                  let size = $0.size
                  AnimatedStickyHeader(safeArea: safeArea, size: size)
                      .ignoresSafeArea(.container, edges: .top)
              }
              .preferredColorScheme(.dark)
    }
}
