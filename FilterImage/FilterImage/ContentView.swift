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
    @State private var currentFilter : CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    @State private var showingFilters = false
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    
    
    func applyProcessing(){
        currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        
        guard let outputImage = currentFilter.outputImage else {return}
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {return}
        
        let uIImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uIImage)
    }
    
    func changeFilter(){
        showingFilters = true

    }
    
    func loadImage(){
        Task{
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else {return}
            guard let inputImage = UIImage(data: imageData) else {return}
            
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
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
                .onChange(of: selectedItem,loadImage)
                    
                    
                    //loadImage() //BURDA DIGER TURLU DE YAZILABILIR EGER UYGULAMA CALISMAZSA BUNA DIKKAT ET !!!!!!!!!!!!!!!
                    
                    /*
                     .onChange(of:selectedItem,loadImage)
                     */
                

                // image area

                Spacer()

                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of:filterIntensity,applyProcessing)
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
            .confirmationDialog("Select a Filter", isPresented: $showingFilters){
                
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Cancel", role: .cancel) { }
                
             //dialog here
            }
        }
    }
}

#Preview {
    ContentView()
}