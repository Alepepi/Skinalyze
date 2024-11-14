//
//  HomepageView.swift
//  Skinalyze
//
//  Created by Frida Pérez Perfecto on 11/11/24.
//

import SwiftUI
import UIKit
import CoreML
import Vision

struct HomepageView: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var imagesFromGallery: [UIImage] = []
    @State private var predictionLabel: String = "Waiting for image..."

    var body: some View {
        
        NavigationView {
            VStack {
                Text("Analyze and identify skin issues, discover recommended treatments and practical care tips for managing skin health.")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing], 15)
                
                Text(predictionLabel)
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding()
                
                Button(action: {
                    sourceType = .camera
                    isImagePickerPresented = true
                }) {
                    VStack(alignment: .leading) {
                        Text("Skin Scanner")
                            .font(.system(size: 20))
                            .foregroundColor(Color.black)
                            .padding(.top, 10)
                            .fontWeight(.bold)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(hex: "#007A39"), lineWidth: 3)
                                .fill(Color(hex: "#AAF0C1"))
                                .frame(width: 300, height: 130)
                            Image(systemName: "camera.fill")
                                .font(.system(size: 50))
                                .foregroundColor(Color(hex: "#007A39"))
                        }
                    }
                }
                .padding(.bottom, 2)
                
                HStack {
                    Button(action: {
                        sourceType = .photoLibrary
                        isImagePickerPresented = true
                    }) {
                        VStack(alignment: .leading) {
                            Text("Catalogue")
                                .font(.system(size: 20))
                                .foregroundColor(Color.black)
                                .padding(.top, 5)
                                .fontWeight(.bold)

                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(hex: "#E6C700"), lineWidth: 4)
                                    .fill(Color(hex: "#FFF9BA"))
                                    .frame(width: 140, height: 120)
                                Image(systemName: "books.vertical.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color(hex: "#E6C700"))
                            }
                        }
                    }
                    Spacer().frame(width: 25)
                    Button(action: {
                        // Aquí puedes agregar otra funcionalidad si es necesario
                    }) {
                        VStack(alignment: .leading) {
                            Text("Medicines")
                                .font(.system(size: 20))
                                .foregroundColor(Color.black)
                                .padding(.top, 5)
                                .fontWeight(.bold)

                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(hex: "#E67700"), lineWidth: 4)
                                    .fill(Color(hex: "#FCC883"))
                                    .frame(width: 140, height: 120)
                                Image(systemName: "pills.fill")
                                    .font(.system(size: 45))
                                    .foregroundColor(Color(hex: "#E67700"))
                            }
                        }
                    }
                }
                
                Spacer()
                    .frame(height: 10)
                
                Button(action: {
                    sourceType = .camera
                    isImagePickerPresented = true
                }) {
                    VStack(alignment: .leading) {
                        Text("Care Tips")
                            .font(.system(size: 20))
                            .foregroundColor(Color.black)
                            .padding(.top, 5)
                            .fontWeight(.bold)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(hex: "#E3001E"), lineWidth: 3)
                                .fill(Color(hex: "#FF8985"))
                                .frame(width: 300, height: 130)
                            Image(systemName: "pencil.and.scribble")
                                .font(.system(size: 50))
                                .foregroundColor(Color(hex: "#E3001E"))
                        }
                    }
                }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(sourceType: sourceType, selectedImage: $selectedImage, imagesFromGallery: $imagesFromGallery, isImagePickerPresented: $isImagePickerPresented, onImagePicked: classifyImage)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image("logo3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        Text("Welcome to Skinalyze")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(.leading)
                    .padding(.top, 45)
                    .padding(.bottom, 20)
                }
            }
        }
    }
    
    func classifyImage(image: UIImage) {
        guard let model = try? VNCoreMLModel(for: ImageClassifier3().model) else {
            predictionLabel = "Error loading model."
            return
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            if let results = request.results as? [VNClassificationObservation],
               let firstResult = results.first {
                DispatchQueue.main.async {
                    self.predictionLabel = "Prediction: \(firstResult.identifier) - \(Int(firstResult.confidence * 100))%"
                }
            } else {
                DispatchQueue.main.async {
                    self.predictionLabel = "Unable to classify image."
                }
            }
        }
        
        if let cgImage = image.cgImage {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            DispatchQueue.global(qos: .userInteractive).async {
                do {
                    try handler.perform([request])
                } catch {
                    DispatchQueue.main.async {
                        self.predictionLabel = "Error: \(error.localizedDescription)"
                    }
                }
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType
    @Binding var selectedImage: UIImage?
    @Binding var imagesFromGallery: [UIImage]
    @Binding var isImagePickerPresented: Bool
    var onImagePicked: (UIImage) -> Void
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                if parent.sourceType == .camera {
                    parent.selectedImage = image
                    parent.onImagePicked(image)
                } else if parent.sourceType == .photoLibrary {
                    parent.imagesFromGallery.append(image)
                }
            }
            parent.isImagePickerPresented = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isImagePickerPresented = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        imagePicker.allowsEditing = false
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
