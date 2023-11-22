// 12/25/19.
import SwiftUI

 struct Person: Identifiable {
    var id = UUID()
    var name = ""
    var city = ""
    var occupation = ""
}

private struct Transition_Challenge2_List: View {
    var data = [Person(name: "Jaqueline", city: "Salt Lake City", occupation: "Model"),
                Person(name: "Mark", city: "Milton", occupation: "Developer")]
    
    var body: some View {
        VStack {
            Text("This doesn't quite work right")
            
            List {
                ForEach(data) { datum in
                    PersonRowView(person: datum)
                }
            }
        }
    }
}

struct Transition_Challenge2_List_Previews: PreviewProvider {
    static var previews: some View {
        Transition_Challenge2_List()
    }
}

struct PersonRowView: View {
    var person: Person
    @State private var show = false
    
    var body: some View {
        VStack {
            HStack {
                Text("\(person.name)")
                Spacer()
                Button(action: { show.toggle() }) {
                    withAnimation(.easeIn(duration: 1)) {
                        Image(systemName: "chevron.down")
                    }
                }
            }
            
            if show {
                HStack {
                    Text("City: \(person.city)")
                    Spacer()
                    Text("Occupation: \(person.occupation)")
                }
                .padding()
                .transition(.move(edge: .bottom).combined(with: .opacity))
//                .transition(.opacity)
            }
        }
        .animation(.easeOut(duration: 0.4), value: show)
    }
}
