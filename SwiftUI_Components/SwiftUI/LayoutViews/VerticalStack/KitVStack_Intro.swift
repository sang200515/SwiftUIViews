//
//  KitVStack_Intro.swift
//  SwiftUI_Views
//
//  Created by Kitwana Akil on 6/16/23.
//  Copyright © 2023 Mark Moeykens. All rights reserved
import SwiftUI

private struct KitVStack_Intro: View {
    var body: some View {
        VStack {
            HeaderView("VStack",
                       subtitle: "Introduction",
                       desc: "A VStack will vertically arrange other views within itself.",
                       back: .blue,
                       textColor: .white)
            Text("View 1")
            Text("View 2")
            Text("View 3")
            Text("View 4")
            Text("View 5")
            Text("View 6")
            Text("View 7")
            Text("View 8")
            Text("View 9")
        }
    }
}

struct KitVStack_Intro_Previews: PreviewProvider {
    static var previews: some View {
        KitVStack_Intro()
    }
}
