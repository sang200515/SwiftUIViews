import SwiftUI
 struct ContentView: View {
    var body: some View {
        VStack {
            VideoPlayer_FromUrl()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

import SwiftUI

struct HeaderView22: View {
    let title: String
    let imageName: String
    
    var body: some View {
        HStack {
            Text(title)
            Image(systemName: imageName)
        }
        .font(.title)
    }
}

struct FooterView22: View {
    let title: String
    let imageName: String
    
    var body: some View {
        VStack {
            Text(title)
            Image(systemName: imageName)
        }
        .font(.title)
    }
}

struct CustomizingList: View {
    var body: some View {
        VStack {
            Text("Customizing List")
                .font(.largeTitle)
                .listRowBackground(Color.red)
            
            List {
                Section(header: HeaderView22(title: "Header", imageName: "star"),
                        footer: FooterView22(title: "Footer", imageName: "star")) {
                    Text("Hello, List!")
                    // 가장 근접한 Modifier가 우선순위가 높음
                    Text("List Row Insets")
                        .listRowInsets(.init(top: 0, leading: 100, bottom: 0, trailing: 0))
                    // 가장 근접한 Modifier가 우선순위가 높음
                    Text("List Row Background")
                        .listRowBackground(Color.blue)
                }
                .listRowInsets(.init(top: 0, leading: 60, bottom: 0, trailing: 0))
                .listRowBackground(Color.yellow)
                
                Section() {
                    Text("One")
                    Text("Two")
                }
                .listRowInsets(.init(top: 0, leading: 100, bottom: 0, trailing: 0))
            }
            .listStyle(GroupedListStyle())
        }
    }
}

struct CustomizingList_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingList()
    }
}
