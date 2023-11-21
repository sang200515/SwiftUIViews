

// Not quite sure where I was going with this. Something that was said in a WWDC video?

import SwiftUI

private struct Form_AlignmentOfLabels: View {
    @State private var firstName = ""
    @State private var middleName = ""
    @State private var lastName = ""
    @State private var trebleOn = true


    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("Form",
                       subtitle: "Alignment",
                       desc: "The Form view can align the edges of controls and their labels.")
            
            Form {
                TextField("First Name", text: $firstName)
                TextField("Middle Name", text: $middleName)
                TextField("Last Name", text: $lastName)
                Toggle("Treble", isOn: $trebleOn)
            }
        }
        .font(.title)
    }
}

struct Form_AlignmentOfLabels_Previews: PreviewProvider {
    static var previews: some View {
        Form_AlignmentOfLabels()
    }
}
