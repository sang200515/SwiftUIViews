//
//  Inset_NegativeValues.swift
//  SwiftUI_Views
//
//11/22/19.
import SwiftUI

fileprivate struct Inset_NegativeValues: View {
    @State private var insetAmout: CGFloat = 10
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Inset").font(.largeTitle)
            Text("Negative Values").foregroundColor(.gray)
            Text("You can EXTEND a shape past its frame by using a negative inset value.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.purple).foregroundColor(.white)
            
            Text("Inset by -20")
            Circle()
                .inset(by: -20)
                .fill(Color.purple)
                .frame(width: 70)
                .border(Color.purple)
            
            Text("Slide to Adjust Inset")
            Rectangle()
                .inset(by: insetAmout)
                .fill(Color.purple)
                .frame(width: 150, height: 150)
                .border(Color.purple)
                .padding(20)
            
            HStack {
                Text("-100")
                Slider(value: $insetAmout, in: -100...20)
                Text("20")
            }.padding()
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Inset_NegativeValues_Previews: PreviewProvider {
    static var previews: some View {
        Inset_NegativeValues()
    }
}
