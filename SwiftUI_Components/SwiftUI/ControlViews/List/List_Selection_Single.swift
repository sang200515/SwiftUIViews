// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI

private struct List_Selection_Single: View {
    @State private var data = ["Practice Coding", "Grocery shopping", "Get tickets", "Clean house", "Do laundry", "Cook dinner", "Paint room"]
    @State private var selection: String?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HeaderView("",
                           subtitle: "Selecting a Row",
                           desc: "Use the selection parameter in List and supply a @State property to hold the selection.")
                
                List(data, id: \.self, selection: $selection) { item in
                    Text(item)
                }
            }
            .font(.title)
            .navigationTitle("List")
            .toolbar { EditButton() }
        }
    }
}

struct List_Selection_Single_Previews: PreviewProvider {
    static var previews: some View {
        List_Selection_Single()
    }
}
