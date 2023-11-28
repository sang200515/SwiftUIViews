//6/30/19.
import SwiftUI

fileprivate struct Form_RowBackgroundImage : View {
    var body: some View {
        Form {
            Section {
                Text("List Row Background")
                    .foregroundColor(.gray)
                Text("Images work a little differently as you can see here.")
                Text("The image is actually set on a row in the second section.")
            } header: {
                Text("Form")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            Section {
                Text("An image is set as a background for the row below. This works fine for rows, but when you use an image on the section level, it is repeated for all rows.")
                Text("The image is set on THIS row, but it extends past the bounds. It also hides the row below this one and goes under the previous rows.")
                    .foregroundColor(.white)
                    .listRowBackground(Image("water")
                                        .blur(radius: 3))
                Text("This row cannot be seen.")
            } header: {
                Text("Images")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        .font(.title2)
    }
}

struct Form_RowBackgroundImage_Previews : PreviewProvider {
    static var previews: some View {
        Form_RowBackgroundImage()
    }
}
