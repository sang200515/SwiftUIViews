// Copyright © 2021 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudi
import SwiftUI

fileprivate struct TimeLineView_Intro: View {
    var body: some View {
        VStack {
            TitleText("TimelineView")
            SubtitleText("Introduction")
            BannerText("The TimelineView is a container that gets updated according to the schedule specified.",
                       backColor: .green, textColor: .black)
            
            TimelineView(.periodic(from: Date.now, by: 1.0)) { context in
                Text("\(context.date.formatted(.dateTime.second(.twoDigits)))")
                    .font(Font.custom("Avenir Next Condensed Bold", size: 300))
            }
            .frame(height: 400)
        }
    }
}

struct TimeLineView_Intro_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineView_Intro()
    }
}
