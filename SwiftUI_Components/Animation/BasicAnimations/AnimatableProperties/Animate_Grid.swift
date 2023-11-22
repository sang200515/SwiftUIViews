import SwiftUI

private struct Animate_Grid: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 24.0) {
            Grid {
                GridRow {
                    if change == false {
                        Color.red.opacity(0.7)
                        Color.green.opacity(0.7)
                    }
                    Color.blue.opacity(0.7)
                        .gridCellColumns(change ? 3 : 1)
                }
                GridRow {
                    Color.blue.opacity(0.7)
                        .gridCellColumns(change ? 3 : 1)
                    
                    if change == false {
                        Color.red.opacity(0.7)
                        Color.green.opacity(0.7)
                    }
                }
                GridRow {
                    if change == false {
                        Color.teal.opacity(0.7)
                    }
                    Color.blue.opacity(0.7)
                        .gridCellColumns(change ? 3 : 1)
                    if change == false {
                        Color.red.opacity(0.7)
                    }
                }
            }
            
            Button("Change") {
                withAnimation {
                    change.toggle()
                }
            }
        }
        .font(.title)
    }
}

struct Animate_Grid_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Grid()
    }
}
