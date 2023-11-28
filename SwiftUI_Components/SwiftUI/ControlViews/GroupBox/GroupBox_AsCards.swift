import SwiftUI

fileprivate struct GroupBox_AsCards: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView("GroupBox",
                       subtitle: "As Cards",
                       desc: "You could use the GroupBox as a 'card' in your UI design.",
                       back: .blue, textColor: .white)
            
            ScrollView {
                ForEach(0 ..< 10) { item in
                    GroupBox {
                        HStack {
                            Image(systemName: "person.circle")
                                .imageScale(.large)
                                
                            VStack(alignment: .leading) {
                                Text("User Name")
                                Text("User Address")
                                    .font(.body)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .padding()
            }
        }
        .font(.title)
    }
}

struct GroupBox_AsCards_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GroupBox_AsCards()
            GroupBox_AsCards()
                .preferredColorScheme(.dark)
        }
    }
}
