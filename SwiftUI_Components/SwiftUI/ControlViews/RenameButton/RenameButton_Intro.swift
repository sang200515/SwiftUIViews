import SwiftUI

fileprivate struct RenameButton_Intro: View {
    @State private var names = ["Rod", "Mark", "Chase"]
    var body: some View {
        List($names, id: \.self) { $name in
            RowView(name: $name)
        }
    }
    
    struct RowView: View {
        @Binding var name: String
        @State private var text = ""
        @FocusState private var isFocused: Bool
        
        var body: some View {
            HStack {
                TextField(text: $name) {
                    Text("Prompt")
//                    RenameButton()
//                        .buttonStyle(.borderedProminent)
                }
                .focused($isFocused)
                .contextMenu {
                    RenameButton()
                    // ... your own custom actions
                }
                .renameAction { isFocused = true }
            }
        }
    }
}

struct RenameButton_Intro_Previews: PreviewProvider {
    static var previews: some View {
        RenameButton_Intro()
    }
}
