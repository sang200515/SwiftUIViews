//
//  ToggleStyle_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

private struct ToggleStyle_Intro: View {
    @State private var toggleState = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Toggle Style").font(.largeTitle)
            Text("Defaults").font(.title).foregroundColor(.gray)
            Text("Here are the default toggle styles already in iOS. They both look and operate exactly the same.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Group {
                Text("DefaultToggleStyle").font(.title)
                Toggle("DefaultToggleStyle", isOn: $toggleState)
                    .toggleStyle(.automatic)
                
                Text("SwitchToggleStyle").font(.title)
                Toggle("SwitchToggleStyle", isOn: $toggleState)
                    .toggleStyle(.switch)
            }
            .padding(.horizontal)
            
            Text("Luckily, we can do more...")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ToggleStyle_Intro()
}
