//
//  ButtonStyle_Default.swift
//  100Views
//
//9/13/19.
import SwiftUI

fileprivate struct ButtonStyle_Default: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("ButtonStyle").font(.largeTitle)
                Text("Defaults").font(.title).foregroundColor(.gray)
                Text("There are some button styles that are already made.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                
                Group {
                    Text("DefaultButtonStyle").font(.title)
                    Button("DefaultButtonStyle", action: {})
                        .buttonStyle(.automatic)
                    
                    Text("PlainButtonStyle").font(.title)
                    Button("PlainButtonStyle", action: {})
                        .buttonStyle(.plain)
                    
                    Text("BorderlessButtonStyle").font(.title)
                    Button("BorderlessButtonStyle", action: {})
                        .buttonStyle(.borderless)
                }
                Text("You don't need to apply the default button style. The plain button style is the only visually different one in iOS. ")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.red)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ButtonStyle_Default()
}
