import SwiftUI

private struct MGE_VStack_Intro: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let fruits = Data.getFruits()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("VStack")
                BannerText("For this example, I'm using a ScrollView for the entire view so we don't get a clipping of the image going out of the parent container.",
                           backColor: .green, textColor: .black)
                ForEach(fruits) { fruit in
                    FruitRowView(namespace: namespace,
                                 selectedFruit: $selectedFruit,
                                 fruit: fruit)
                }
            }
        }
        .overlay {
            Group {
                if let fruitInfo = selectedFruit {
                    MGEFruitDetailFullView(namespace: namespace,
                                           selectedFruit: $selectedFruit,
                                           fruit: fruitInfo)
                }
            }
        }
    }
}

struct FruitRowView: View {
    var namespace: Namespace.ID
    @Binding var selectedFruit: Item!
    var fruit: Item
    
    var body: some View {
        ZStack {
            if fruit.id != selectedFruit?.id {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.green)
                    .padding(.horizontal)
                    .matchedGeometryEffect(id: fruit.id, in: namespace)
                HStack {
                    Image(fruit.imageName)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .matchedGeometryEffect(id: fruit.imageName, in: namespace)
                        .frame(width: 175, height: 175)
                        .padding(.leading)
                    
                    Text(fruit.name)
                        .font(.title)
                        .matchedGeometryEffect(id: fruit.name+"title",
                                               in: namespace, properties: .position)
                    Spacer()
                }
            } else {
                Color.clear.frame(height: 175)
            }
        }
        .onTapGesture {
            withAnimation {
                selectedFruit = fruit
            }
        }
    }
}

struct MGEFruitDetailFullView: View {
    var namespace: Namespace.ID
    @Binding var selectedFruit: Item!
    var fruit: Item
    @State private var show = false
    @State var delayTime = 0.5
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
                .matchedGeometryEffect(id: fruit.id, in: namespace)
            
            VStack(spacing: 20) {
                HStack {
                    Image(fruit.imageName)
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: fruit.imageName, in: namespace)
                        .shadow(radius: 5)
                        .padding(40)
                        .background {
                            Circle()
                                .fill(Color.white)
                                .opacity(show ? 1 : 0)
                                .scaleEffect(show ? 1 : 0.2)
                                .animation(.spring(dampingFraction: 0.6)
                                            .delay(delayTime), value: show)
                        }
                        .frame(width: 180, height: 170)
                    
                    Text(fruit.name)
                        .font(.title).bold()
                        .foregroundColor(.black)
                        .matchedGeometryEffect(id: fruit.name+"title",
                                               in: namespace, properties: .position)
                    Spacer()
                }
                
                Spacer()
                
                Group {
                    Text("Details about the \(fruit.name).")
                    Button(action: {
                        withAnimation {
                            selectedFruit = nil
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                }
                .opacity(show ? 1 : 0)
                .animation(.easeInOut.delay(delayTime), value: show)
            }
            .font(.title)
            .padding(.top)
            .onAppear {
                show.toggle()
            }
        }
    }
}

struct MGE_VStack_Intro_Previews: PreviewProvider {
    @Namespace static var ns
    @State static var selectedFruit: Item? = Item(name: "Blackberries",
                                                  imageName: "Blackberries")
    @State static var nilSelectedFruit: Item?
    
    static var previews: some View {
        Group {
            MGE_VStack_Intro()
            
            FruitRowView(namespace: ns,
                         selectedFruit: $nilSelectedFruit,
                         fruit: selectedFruit!)
                .frame(height: 175)
                .previewLayout(.sizeThatFits)
            
            MGEFruitDetailFullView(namespace: ns,
                                   selectedFruit: $selectedFruit,
                                   fruit: selectedFruit!)
        }
    }
}
