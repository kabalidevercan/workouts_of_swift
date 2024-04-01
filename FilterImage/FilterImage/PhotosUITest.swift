//
//  PhotosUITest.swift
//  FilterImage
//
//  Created by Ercan Kabali on 1.04.2024.
//

import SwiftUI
import PhotosUI

struct PhotosUITest: View {
    @State private var pickerItem : PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    
    
    var body: some View {
        VStack{
            PhotosPicker("Photo Picker", selection: $pickerItem,matching: .images)
            selectedImage?
                .resizable()
                .scaledToFit()
        }
        .onChange(of:pickerItem){
            Task{
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
        VStack{
            PhotosPicker("Select Images", selection: $pickerItems,matching: .images)
        }
        .onChange(of:pickerItems){
            Task{
                selectedImages.removeAll()
                
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self){
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
        ScrollView{
            ForEach(0..<selectedImages.count,id: \.self){
                item in
                selectedImages[item]
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    PhotosUITest()
}
