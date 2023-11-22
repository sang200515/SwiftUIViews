import SwiftUI

private struct FullScreenCover_Intro: View {
    @State private var showDetailView = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("FullScreenCover",
                       subtitle: "Introduction",
                       desc: "Use fullScreenCover modifier to present another view as a full screen (push-out view).",
                       back: .blue, textColor: .white)
            
            Spacer()
            
            Button(action: {
                showDetailView = true
            }, label: {
                Text("Show Details")
            })
            
            Spacer()
        }
        .font(.title)
        .fullScreenCover(isPresented: $showDetailView) {
            FullScreenCoverDetailView()
        }
    }
}

struct FullScreenCoverDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "macwindow.on.rectangle")
            HeaderView("FullScreenCover",
                       subtitle: "Detail View",
                       desc: "Use @Environment(\\.dismiss) to dismiss the view.",
                       back: .blue, textColor: .white)
            Spacer()
            Button(action: {
                dismiss()
            }, label: {
                Text("Dismiss")
            })
            
            Spacer()
        }
        .font(.title)
    }
}

struct FullScreenCover_Intro_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCover_Intro()
    }
}
