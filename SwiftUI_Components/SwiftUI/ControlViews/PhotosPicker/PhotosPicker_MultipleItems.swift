//
//
//import SwiftUI
//import PhotosUI
//
//private  struct PhotosPicker_MultipleItems: View {
//    @State private var photos: [PhotosPickerItem] = []
//    @State private var selectedImages: [Image] = []
//    
//    var body: some View {
//        VStack {
//            PhotosPicker(
//                selection: $photos,
//                matching: .images
//            ) {
//                Text("Photos")
//            }
//            
//            if (photos.count > 0) {
//                Text("Selected Photos")
//                List {
//                    ForEach(0..<selectedImages.count, id: \.self) { index in
//                        selectedImages[index]
//                            .resizable()
//                            .scaledToFit()
//                    }
//                }
//            }
//            Spacer()
//        }
//        .font(.title)
//        .onChange(of: photos) { newPhotos in
//            Task {
//                for newPhoto in newPhotos {
//                    await selectedImages.append(newPhoto.convert())
//                }
//            }
//        }
//    }
//}
//
//struct PhotosPicker_MultipleItems_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosPicker_MultipleItems()
//    }
//}
