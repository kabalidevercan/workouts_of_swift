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

struct InstaFilterDeneme: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem : PhotosPickerItem?
    @State private var currentFilter : CIFilter = CIFilter.sepiaTone()
    @State private var filterRadius = 100
    @State private var filterScale = 10
    
    
    let context = CIContext()
    @State private var showingFilters = false
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    
  @MainActor  func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1
        
        if filterCount >= 3 {
            requestReview()
        }
    }
    
    
    func applyProcessing(){

        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey){currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)}
        
        if inputKeys.contains(kCIInputRadiusKey){currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)}
        
        if inputKeys.contains(kCIInputScaleKey){currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)}
        
        
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
                .onChange(of:selectedItem){
                    loadImage()
                }
                    

                Spacer()
                
                
                HStack {
                    Text("Intensity")

                    if let processedImage {
                        Slider(value: $filterIntensity)
                            .onChange(of:filterIntensity,applyProcessing)
                        
                    }
                   
                }
                .padding(.vertical)
            
                HStack(spacing:20){
                    
                    
                    // share the picture
                    
                    if let processedImage {
                        Button("Change Filter",action: changeFilter)
                            .buttonStyle(.borderedProminent)
                        ShareLink(item: processedImage,preview: SharePreview("FilterImage", image: processedImage))
                    }
                    
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
    InstaFilterDeneme()
}
