//  Created by Mark Moeykens on 6/17/19.
import SwiftUI

private struct List_Grouped : View {
    var data = ["Grouped List Style", "This list is using the group list style", "Evans", "Lemuel James Guerrero", "Mark", "Durtschi", "Chase", "Adam", "Rodrigo"]
    
    var body: some View {
        List(data, id: \.self) { datum in
            HStack {
                Text(datum)
                    .font(datum == "Grouped List Style"
                        ? Font.largeTitle : Font.body)
                
                Spacer()
                
                Image(systemName: datum == "Mark"
                    ? "circle.fill" : "circle")
                    .foregroundColor(Color.green)
            }
        }
            // Change the List Style to Grouped
        .listStyle(.grouped)
    }
}

struct List_Grouped_Previews : PreviewProvider {
    static var previews: some View {
        List_Grouped()
            .preferredColorScheme(.dark)
    }
}
