//
//  SelectImageAndImagesTest.swift
//  FilterImage
//
//  Created by Ercan Kabali on 1.04.2024.
//

import SwiftUI
import PhotosUI

struct SelectImageAndImagesTest: View {
    @State private var pickerItem : PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var listOfPickerItems = [PhotosPickerItem]()
    @State private var listOfSelectedImages = [Image]()
    
    
    var body: some View {
        VStack{
            PhotosPicker(selection: $listOfPickerItems,maxSelectionCount: 3,matching: .images){
                Label("Get Photos", systemImage: "photo")
            }
            
        }
        .onChange(of: listOfPickerItems){
            Task{
                listOfSelectedImages.removeAll()
                
                for item in listOfPickerItems{
                    if let loadedImage = try await item.loadTransferable(type: Image.self){
                        listOfSelectedImages.append(loadedImage)
                    }
                }
            }
            
        }

        
        ScrollView{
            ForEach(0..<listOfSelectedImages.count,id: \.self){item in
                    listOfSelectedImages[item]
                    .resizable()
                    .scaledToFit()
            }
        }
        
       /* VStack{
        PhotosPicker("Select One Image", selection: $pickerItem,matching:.images)
        selectedImage?
            .resizable()
            .scaledToFit()
    }
    .onChange(of:pickerItem){
        Task{
            selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
        }
    }*/
    }
}

#Preview {
    SelectImageAndImagesTest()
}
