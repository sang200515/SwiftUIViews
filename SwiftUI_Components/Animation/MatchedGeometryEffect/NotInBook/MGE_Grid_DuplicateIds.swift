
import SwiftUI

fileprivate struct TestData: Identifiable {
    let id = UUID()
    var data = ""
}

struct MGE_Grid_DuplicateIds: View {
    @State private var data = [TestData(data: "1"), TestData(data: "2")]
    @State private var selectedItem: TestData?
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            VStack(spacing: 10.0) {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible())]) {
                        ForEach(data) { datum in
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.green)
                                
                                if datum.id != selectedItem?.id {
                                    Button(action: {
                                        withAnimation(.spring()) {
                                            selectedItem = datum
                                        }
                                    }) {
                                        Text(datum.data)
                                            .matchedGeometryEffect(id: datum.id, in: namespace)
                                    }
                                }
                            }
                            .frame(height: 100)
                        }
                    }
                }
            }
        }
    }
}

struct MGE_Grid_DuplicateIds_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Grid_DuplicateIds()
    }
}
