//
//  ImagePaint_Intro.swift
//  100Views
//
//7/13/19.
import SwiftUI

fileprivate struct ImagePaint_Intro : View {
    var body: some View {
        let imgPaint = ImagePaint(image: Image("repeatableImage"))
        
        return ZStack {
            Rectangle()
                .fill(imgPaint)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("ImagePaint")
                    .font(.system(.largeTitle, design: .serif))
                
                Text("Introduction")
                    .foregroundColor(.gray)
                    .font(.system(.title, design: .serif))
                
                Text("The background image used here is a made of repeated tiles. ImagePaint is NOT a view. You use it to fill shapes.")
                    .frame(maxWidth: .infinity).padding()
                    .background(Color.black).foregroundColor(Color.yellow)
                    .font(.system(.title, design: .serif))
                
                Spacer()
            }
        }
    }
}

struct ImagePaint_Intro_Previews : PreviewProvider {
    static var previews: some View {
        ImagePaint_Intro()
    }
}
