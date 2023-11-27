//
//  DownloadButtonView.swift
//  SwiftUI_Components
//
//  Created by Em bé cute on 11/27/23.
//

import SwiftUI


private struct DownloadButton: View {
    enum DownloadStatus {
        case ready
        case started
        case finished
    }

    @State private var status: DownloadStatus = .ready
    @State var progress: CGFloat = 0.0
    private var progressBarWidth: CGFloat = 250
    private var animationTime: TimeInterval = 0.3
    private var progressBarAnimationTime: TimeInterval = 2.4
    
    var body: some View {
        VStack(spacing: 2){
            Text("Open File")
                .font(.title)
                .opacity((status == .finished) ? 1: 0)
                .animation(.easeOut(duration: animationTime))
            
            ZStack{
                ProgressBar(initialProgress: $progress, color: .white)
                    .frame(height: (status == .ready) ? 80 : 12)
                    .animation(.easeIn(duration: animationTime))
                Text("Download")
                    .font(.system(size: 26, weight: .bold))
                    .opacity((status == .ready) ? 1 : 0)
                    .animation(.easeIn(duration: animationTime))
            }
            .frame(width: (status == .finished) ? 150 : progressBarWidth)
            .onTapGesture {
                download()
            }
        }
    }
    func download() {
        status = .started
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            self.progress += 0.1
            if self.progress >= 1.0 {
                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
                    status = .finished
                    
                }
            }
            
        }
    }
    
    struct ProgressBar: View {
        
      @Binding var progress: CGFloat

        private var barColor: Color
        private var animationTime: TimeInterval = 0.3

        public init(initialProgress: Binding<CGFloat>, color: Color) {
            self._progress = initialProgress
            self.barColor = color
        }
        
        var body: some View {
            GeometryReader{ geo in
                ZStack(alignment: .leading){
                    Rectangle()
                        .fill(barColor.opacity(0.3))
                    
                    Rectangle()
                        .fill(barColor)
                        .frame(width: min(geo.size.width, geo.size.width * progress))
                        .animation(.linear)
                }.cornerRadius(25.0)
            }
        }
    }
}

struct DownloadButton_Previews: PreviewProvider {
    static var previews: some View {
        DownloadButton()
            .preferredColorScheme(.dark)
    }
}
