//
//  BasicAnimations_CheckUnderstanding1.swift
//  SwiftUIAnimations
//
// 10/27/19.
import SwiftUI

fileprivate struct BasicAnimations_CheckUnderstanding1: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 10)
            
            RoundedRectangle(cornerRadius: 10)
//                .offset(x: change ? 50 : 0, y: change ? 50 : 0)
//                .frame(width: change ? 100 : 400, height: change ? 50 : 200)
                .scaleEffect(change ? 0.5 : 1)  // Correct
                // Insert code here
                .animation(.default, value: change)

            RoundedRectangle(cornerRadius: 10)
            
            Button("Change") {
                change.toggle()
            }
        }.foregroundColor(.blue)
    }
}

struct BasicAnimations_CheckUnderstanding1_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_CheckUnderstanding1()
    }
}
