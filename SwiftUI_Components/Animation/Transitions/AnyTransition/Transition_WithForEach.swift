//  Copyright © 2021 Mark Moeykens. All rights reserved. | @BigMtnStudi
import SwiftUI

class MyViewModel: ObservableObject {
    @Published var items: [Item] = []
    
    func fetchItems() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.items = [Item(name: "Rod"),
                          Item(name: "Mark"),
                          Item(name: "Chase")]
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.items.insert(Item(name: "Lem"), at: 1)
            self.items.insert(Item(name: "Chris"), at: 3)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.items.insert(Item(name: "Parker"), at: 1)
            self.items.append(Item(name: "Dave"))
        }
    }
}

struct Transition_WithForEach: View {
    @StateObject private var viewModel = MyViewModel()
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("With ForEach").foregroundColor(Color("LightAccent2"))
                BannerText("When rows are added, they are inserted into the view hierarchy. You can assign a transition and animation to use when this happens.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.items) { item in
                            CardView(item: item, animate: true)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchItems()
        }
    }
}

struct CardView: View {
    var item: Item
    var animate = false
    
    var body: some View {
        Text(item.name)
            .foregroundColor(Color("LightShade2"))
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("DarkAccent2"))
            .padding(.horizontal)
            .transition(.scale.animation(.spring(response: 0.5, dampingFraction: 0.55)))
    }
}

struct Transition_WithForEach_Previews: PreviewProvider {
    static var previews: some View {
        Transition_WithForEach()
    }
}
