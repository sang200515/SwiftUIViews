//
//  ToggleStyle_isOn.swift
//  100Views
//
//9/13/19.
import SwiftUI

fileprivate struct ToggleStyle_isOn: View {
    @State private var toggleState = true
    @State private var toggleState2 = false
    var body: some View {
        VStack(spacing: 30) {
            Text("Toggle Style").font(.largeTitle)
            Text("Is On").font(.title).foregroundColor(.gray)
            Text("You could say the isOn property is the main component of the Toggle. You can customize a toggle to represent this on/off, true/false state.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    CheckMarkToggleStyle(label: "isOn is True",
                                         color: .purple))
            Toggle("", isOn: $toggleState2)
                .toggleStyle(
                    CheckMarkToggleStyle(label: "isOn is False",
                                         color: .purple))
            
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    CheckMarkToggleStyle(label: "My Checkmark Toggle",
                                                  color: .green))
        }
    }
}

private struct CheckMarkToggleStyle: ToggleStyle {
    var label = ""
    var color = Color.primary
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label)
            Spacer()
            Button(action: { configuration.isOn.toggle() } )
            {
                Image(systemName: configuration.isOn
                    ? "checkmark.square.fill"
                    : "square.fill")
                    .foregroundColor(color)
            }
        }
        .font(.title)
        .padding(.horizontal)
    }
}

#Preview {
    ToggleStyle_isOn()
}
