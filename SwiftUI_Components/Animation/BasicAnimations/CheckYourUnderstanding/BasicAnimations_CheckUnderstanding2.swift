//
//  BasicAnimations_CheckUnderstanding2.swift
//  SwiftUIAnimations
//
// 10/27/19.
import SwiftUI

fileprivate struct BasicAnimations_CheckUnderstanding2: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 10)
            
            Text("Hello!")
                .animation(.default, value: change)
                .font(.system(size: change ? 160 : 40))
            //                    .font(.system(size: 40))
            //                    .scaleEffect(change ? 4 : 1)
            //                    .font(.system(size: 160)) // Correct
            //                    .scaleEffect(change ? 1 : 0.25) // Correct
            // Insert code here
            
            RoundedRectangle(cornerRadius: 10)
            
            Button("Change") {
                change.toggle()
            }
        }
        .foregroundColor(.blue)
    }
}

struct BasicAnimations_CheckUnderstanding2_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_CheckUnderstanding2()
    }
}
