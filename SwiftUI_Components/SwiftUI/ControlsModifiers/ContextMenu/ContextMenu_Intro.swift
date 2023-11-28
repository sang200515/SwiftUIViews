//
//  Menu_Intro.swift
//  100Views
//
//8/18/19.
import SwiftUI

fileprivate struct ContextMenu_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("ContextMenu",
                       subtitle: "Introduction",
                       desc: "The ContextMenu can be attached to most views. You don't need gestures to make them work.",
                       back: .orange, textColor: .white)
            
            HStack {
                Text("Get Help")
                Spacer()
                Image(systemName: "questionmark.diamond.fill")
                    .font(.title)
                    .foregroundColor(.orange)
                    .frame(width: 44, height: 44)
                    .contextMenu {
                        Button(action: {}) {
                            Text("Add color")
                            Image(systemName: "eyedropper.full")
                        }
                        Button(action: {}) {
                            Image(systemName: "circle.lefthalf.fill")
                            Text("Change contrast")
                        }
                    }
            }
            .padding()
        }
        .font(.title)
    }
}

struct ContextMenu_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu_Intro()
    }
}
