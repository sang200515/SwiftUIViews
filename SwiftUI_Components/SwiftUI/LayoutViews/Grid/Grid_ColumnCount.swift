import SwiftUI

private struct Grid_ColumnCount: View {
    var body: some View {
        Grid {
            GridRow {
                ForEach(1..<3) { number in
                    Image(systemName: "\(number).square")
                }
            }
            GridRow {
                ForEach(1..<5) { number in
                    Image(systemName: "\(number).square")
                }
            }
            GridRow {
                ForEach(1..<8) { number in
                    Image(systemName: "\(number).square")
                }
            }
        }
        .font(.largeTitle)
    }
}

struct Grid_ColumnCount_Previews: PreviewProvider {
    static var previews: some View {
        Grid_ColumnCount()
    }
}
