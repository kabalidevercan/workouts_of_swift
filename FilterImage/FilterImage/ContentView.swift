//
//  ContentView.swift
//  FilterImage
//
//  Created by Ercan Kabali on 21.03.2024.
//

import SwiftUI
import PhotosUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem : PhotosPickerItem?
    
    func changeFilter(){
        print("works great")
    }
    
    func loadImage(){
        Task{
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else {return}
            guard let inputImage = UIImage(data: imageData) else {return}
            
            /////more code to come
        }
    }
    
    
    var body: some View{
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem){
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    }else {
                        ContentUnavailableView{
                            Label("No picture",systemImage: "photo.badge.plus")
                        }description: {
                            Text("Tap to import a photo")
                        }actions: {
                            Button("Import"){
                                
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                }
                .onChange(of: selectedItem){
                    loadImage() //BURDA DIGER TURLU DE YAZILABILIR EGER UYGULAMA CALISMAZSA BUNA DIKKAT ET !!!!!!!!!!!!!!!
                }

                // image area

                Spacer()

                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                .padding(.vertical)

                HStack {
                    Button("Change Filter",action: changeFilter)

                    Spacer()

                    // share the picture
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
        }
    }
}

#Preview {
    ContentView()
}
