import SwiftUI

/* Use different initializers depending on what part of the LabeledContent you want to customize. */

private struct LabeledContent_Customization: View {
    var body: some View {
        VStack(spacing: 50.0) {
            LabeledContent("Label") {
                Text("Value")
            }

            LabeledContent("Label") {
                Text("Value")
                    .foregroundColor(.purple)
            }
            
            LabeledContent {
                Text("Value")
            } label: {
                Text("Label")
                    .foregroundColor(.purple)
            }
            
            LabeledContent("Label") {
                Text("Value")
            }
            .foregroundColor(.purple)
            
            LabeledContent("Label") {
                Text("Value")
            }
            .padding()
            .background(Color.blue.opacity(0.1), in: RoundedRectangle(cornerRadius: 16))
        }
        .padding()
        .font(.title)
    }
}

struct LabeledContent_Customization_Previews: PreviewProvider {
    static var previews: some View {
        LabeledContent_Customization()
    }
}
