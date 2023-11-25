//
//  ZIndex_Intro.swift
//  SwiftUI_Views
//
//11/11/19.
import SwiftUI

private struct ZIndex_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Z Index").font(.largeTitle)
            Text("Introduction").foregroundColor(.gray)
            Text("The zIndex modifier can move views up on top of other views.")
                .frame(maxWidth: .infinity)
                .padding()
				.background(Color.blue)
                .foregroundColor(.white)
			
			RoundedRectangle(cornerRadius: 20)
				.fill(Color.green)
				.padding(.horizontal, 50)
				.overlay(Text("1"))
			
			RoundedRectangle(cornerRadius: 20)
				.fill(Color.orange)
				.padding(.horizontal, 50)
				.scaleEffect(1.5)
				.overlay(Text("2"))
			
			RoundedRectangle(cornerRadius: 20)
				.fill(Color.yellow)
				.padding(.horizontal, 50)
				.overlay(Text("3"))
			
            Text("Here is the default order of layout index.")
                .frame(maxWidth: .infinity)
                .padding()
				.background(Color.blue)
                .foregroundColor(.white)
		}
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct ZIndex_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ZIndex_Intro()
    }
}
