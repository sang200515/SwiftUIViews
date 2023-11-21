//  Created by Mark Moeykens on 8/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.

import SwiftUI

private struct ActionSheet_Intro: View {
    @State private var presentingActionSheet = false
    
    var actionSheet =
        ActionSheet(
            title: Text("Action Sheet Title"),
            message: Text("Action Sheet Message"),
            buttons: [
                .default(Text("Default Button"), action: {
                    // Default Button code
                }),
                .destructive(Text("Destructive Button"), action: {
                    // Destructive Button code
                }),
                .cancel()
        ])
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("ActionSheet", subtitle: "Introduction",
                       desc: "The ActionSheet view holds all the parts of an action sheet in one object to be presented.",
                       back: .blue, textColor: .white)
            
            Button("Show ActionSheet") {
                presentingActionSheet = true
            }
            
            Spacer()
        }
        .actionSheet(isPresented: $presentingActionSheet) {
            // Which ActionSheet do you want to return?
            // Remember, the return keyword is optional for single expressions
            actionSheet
        }
        .font(.title)
    }
}

struct ActionSheet_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheet_Intro()
    }
}
