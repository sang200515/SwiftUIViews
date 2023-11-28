//6/30/19.
import SwiftUI

fileprivate struct Form_ListRowInset : View {
    var body: some View {
        Form {
            Section {
                Text("List Row Inset")
                    .foregroundColor(.gray)
                Text("You can use the listRowInsets modifier to adjust the indentation:")
                    .foregroundColor(.white)
                    .listRowBackground(Color.purple)
                
                Text("Indent Level 1")
                    .listRowInsets(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                
                Text("Indent Level 2")
                    .listRowInsets(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 0))
                
                Text("Or Vertical Alignment")
                    .foregroundColor(.white)
                    .listRowBackground(Color.purple)
                
                Text("Top")
                    .listRowInsets(EdgeInsets(top: -20, leading: 40, bottom: 0, trailing: 0))
                
                Text("Bottom")
                    .listRowInsets(EdgeInsets(top: 20, leading: 40, bottom: 0, trailing: 0))
            } header: {
                Text("Form")
                    .font(.title)
                    .foregroundColor(.gray)
            }
        }
        .font(.title2)
    }
}

struct Form_ListRowInset_Previews : PreviewProvider {
    static var previews: some View {
        Form_ListRowInset()
    }
}
