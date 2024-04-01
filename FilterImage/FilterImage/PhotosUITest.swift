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
    
    var body: some View {
        VStack{
            PhotosPicker("Photo Picker", selection: $pickerItem,matching: .images)
        }
        .onChange(of:pickerItem){
            Task{
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
    }
}

#Preview {
    PhotosUITest()
}
