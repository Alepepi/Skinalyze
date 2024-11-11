//
//  HomepageView.swift
//  Skinalyze
//
//  Created by Frida Pérez Perfecto on 11/11/24.
//

import SwiftUI
import UIKit

struct HomepageView: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var imagesFromGallery: [UIImage] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Cuidado de la piel")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                
                Spacer()
                
                Button(action: {
                    sourceType = .camera
                    isImagePickerPresented = true
                }) {
                    VStack {
                        Text("Scanner")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(.top, 10)
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.blue.opacity(0.3))
                                .frame(width: 300, height: 200)
                                .shadow(radius: 10)
                            
                            Image(systemName: "camera")
                                .font(.system(size: 50))
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding(.bottom, 15)
                
                HStack {
                    Button(action: {
                        sourceType = .photoLibrary
                        isImagePickerPresented = true
                    }) {
                        VStack {
                            Text("Galería")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .padding(.top, 5)
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.blue.opacity(0.3))
                                    .frame(width: 140, height: 100)
                                    .shadow(radius: 5)
                                
                                Image(systemName: "photo.on.rectangle.angled")
                                    .font(.system(size: 30))
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    
                    Spacer().frame(width: 25)
                    
                    Button(action: {
                    }) {
                        VStack {
                            Text("AI Chat")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .padding(.top, 5)
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.blue.opacity(0.3))
                                    .frame(width: 140, height: 100)
                                    .shadow(radius: 5)
                                
                                Image(systemName: "message")
                                    .font(.system(size: 30))
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .padding(.bottom, 20)
                
                Spacer()
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(sourceType: sourceType, selectedImage: $selectedImage, imagesFromGallery: $imagesFromGallery, isImagePickerPresented: $isImagePickerPresented)
            }
            .navigationBarHidden(true)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType
    @Binding var selectedImage: UIImage?
    @Binding var imagesFromGallery: [UIImage]
    @Binding var isImagePickerPresented: Bool
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                if parent.sourceType == .camera {
                    parent.selectedImage = image
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
