//11/11/19.
import SwiftUI

private struct FixedSize_TextTruncated: View {
	var body: some View {
		VStack(spacing: 10) {
            HeaderView("Fixed Size", subtitle: "Prevent Text Truncating",
                       desc: "Use the fixedSize modifier to prevent text from truncating when layoutPriority won't work.",
                       back: .yellow)
			Form {
				Section {
					Text("Sometimes you get text that truncates like this:")
					
					Text("This text goes on for too long and will eventually get truncated if you don't use the fixedSize modifier.")
						.listRowBackground(Color.pink)
						.layoutPriority(1) // Does not show truncated text
					
					Text("This text goes on for too long and will eventually get truncated if you don't use the fixedSize modifier.")
						.listRowBackground(Color.green)
						.fixedSize(horizontal: false, vertical: true) // Use fixed size to expand the text vertically in this situation.
                } header: {
                    Text("Text in a Form")
                        .font(.largeTitle)
                }
			}
		}
        .font(.title2)
	}
}

struct FixedSize_TextTruncated_Previews: PreviewProvider {
	static var previews: some View {
		FixedSize_TextTruncated()
	}
}
