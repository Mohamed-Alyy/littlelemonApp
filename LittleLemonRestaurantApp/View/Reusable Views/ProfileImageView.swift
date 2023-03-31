
import SwiftUI
struct profileImageView: View {
    @State  var selectedImage: UIImage? = nil
    @State  var showImagePicker: Bool = false

    
    var body: some View {
        VStack {
            if let photo = Helper.profilePhoto{
                Image(uiImage: photo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120, alignment: .center)
                    .clipShape(Capsule())
                    .foregroundColor(.accentColor)

            } else {

                ZStack {
                    if let image =  Helper.kSampleImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200, alignment: .center)
                            .clipShape(Capsule())
                            .foregroundColor(.accentColor)
                    }

                    Text("Select Photo")
                        .fontWeight(.bold)
                        .padding(.top, 100)

                }

            }

        }
        .onTapGesture {
            showImagePicker = true
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(selectedImage: self.$selectedImage)
          
        }.onChange(of: selectedImage) { newImage in
            selectedImage = newImage
        }
        
    }
    
}

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(selectedImage: $selectedImage)
    }
}

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var selectedImage: UIImage?
    
    init(selectedImage: Binding<UIImage?>) {
        self._selectedImage = selectedImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            selectedImage = image
            
            // Save image in userDefault as String
            Helper.imageToString(image: image) { imageString in
                UserDefaults.standard.set(imageString, forKey: Helper.kProfileImage)
            }
            
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


struct profileImageView_Previews: PreviewProvider {

    static var previews: some View {
        profileImageView()
    }
}
