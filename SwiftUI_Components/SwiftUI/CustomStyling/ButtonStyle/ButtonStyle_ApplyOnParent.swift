//
//  ButtonStyle_ApplyOnParent.swift
//  100Views
//
//9/13/19.
import SwiftUI

private struct ButtonStyle_ApplyOnParent: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ButtonStyle").font(.largeTitle)
            Text("Apply Style to Parent").foregroundColor(.gray)
            Text("You can apply a style to many controls by applying the style to a parent view.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
            
            Button("Button 1", action: {})
            
            Button("Using ButtonStyle", action: {})
            
            Button("Override ButtonStyle", action: {})
                // Add other modiers
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 8)
                    .fill(Color(UIColor.systemTeal)))
            
            Button("Reapply ButtonStyle", action: {})
            //        .buttonStyle(OutlineButtonStyle(buttonColor: .red))
        }
        .font(.title)
            // This style will be applied to All buttons within
            .buttonStyle(OutlineButtonStyle())
    }
}

#Preview {
    ButtonStyle_ApplyOnParent()
}
