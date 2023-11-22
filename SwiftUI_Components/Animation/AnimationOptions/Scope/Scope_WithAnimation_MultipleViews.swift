//
//  Scope_WithAnimation_MultipleViews.swift
//  SwiftUIAnimations
//
// 11/24/19.
import SwiftUI

private struct Scope_WithAnimation_MultipleViews: View {
    @State private var unlock = false
    @State private var open = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("With Animation")
            SubtitleText("Multiple Views")
            BannerText("Any value changed within the withAnimation closure will animate the view that uses that value in its modifiers. This value can exist anywhere in the view hierarchy and affect many views.",
                       backColor: .yellow, textColor: .black)
            
            Button(action: {
                withAnimation {
                    unlock.toggle()
                }
            }) {
                Image(systemName: unlock ? "lock.open" : "lock")
                    .offset(x: unlock ? 4.5 : 0)
                    .animation(.none, value: unlock)
            }
            
            GeometryReader { geometry in
                ZStack {
                    VStack {
                        Text("Hello!")
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                    }
                    .font(.system(size: 50))
                    
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(unlock ? Color.green : Color.red)
                            .offset(x: open ? -geometry.size.width : 0)
                        Rectangle()
                            .fill(unlock ? Color.green : Color.red)
                            .offset(x: open ? geometry.size.width : 0)
                    }
                    
                    if unlock && open == false {
                        Button("O P E N") {
                            withAnimation(.easeOut(duration: 0.7)) {
                                open = true
                            }
                        }
                    }
                }
            }
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct Scope_WithAnimation_MultipleViews_Previews: PreviewProvider {
    static var previews: some View {
        Scope_WithAnimation_MultipleViews()
    }
}
