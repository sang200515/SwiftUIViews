//6/29/19.
import SwiftUI

fileprivate struct Form_ListRowBackground : View {
    var body: some View {
        Form {
            Section {
                Text("List Row Background")
                    .foregroundColor(.gray)
                
                Text("Forms and Lists allow you to set a background view with a function called \"listRowBackground(view:)\".")
                
                Text("You can use this modifier on just one row, like this.")
                    .listRowBackground(Color.purple)
                    .foregroundColor(.white)
            } header: {
                Text("Form").font(.largeTitle)
            }
            
            Section {
                Text("Or you can set a view or color for a whole section.")
                
                Text("Note, the color of the section header is not affected when set on Section.")
                    .fixedSize(horizontal: false, vertical: true)
            } header: {
                Text("Whole Section")
                    .font(.title).foregroundColor(.gray)
            }
            .foregroundColor(.white)
            .listRowBackground(Color.purple)
        }
        .font(.title2)
    }
}

struct Form_ListRowBackground_Previews : PreviewProvider {
    static var previews: some View {
        Form_ListRowBackground()
    }
}
