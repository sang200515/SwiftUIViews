// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

private struct TimeLineView_Animation: View {
    @State private var isPaused = false
    
    var body: some View {
        VStack {
            TitleText("TimelineView")
            SubtitleText("Animation")
            BannerText("You can pause TimelineView updates using the animation scheduler.",
                       backColor: .green, textColor: .black)
            
            TimelineView(.animation(minimumInterval: 0.1, paused: isPaused)) { context in
                Text("\(context.date.formatted(.dateTime.second(.twoDigits)))")
                    .font(Font.custom("Avenir Next Condensed Bold", size: 300))
            }
            .frame(height: 400)
            
            Button(isPaused ? "Start" : "Pause") {
                isPaused.toggle()
            }
            .buttonStyle(.borderedProminent)
            .font(.title)
        }
    }
}

struct TimeLineView_Animation_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineView_Animation()
    }
}
