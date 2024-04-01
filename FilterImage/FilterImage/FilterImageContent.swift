//
//  FilterImageContent.swift
//  FilterImage
//
//  Created by Ercan Kabali on 31.03.2024.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins


struct FilterImageContent: View {
    
    @State private  var image:Image?
    
    
    var body: some View {
        VStack{
            image?
                .resizable()
                .scaledToFill()
            
            
            ContentUnavailableView("Welcome to Canva",systemImage: "lasso.badge.sparkles")
            
            ContentUnavailableView{
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .padding(.bottom,20)
            }description: {
                Text("Let's Sign Up to see what's going on")
            }actions: {
                Button("Sign Up"){
                    
                }
                .buttonStyle(.borderedProminent)
            }
            
            /*ContentUnavailableView{
                Text("This section is gonna be title")
                    
            }description: {
                Text("This section is gonna be description")
            }actions: {
                Button("Create a random snippet m.f"){
                    
                }
                .buttonStyle(.borderedProminent)
            }*/
            
        }
        .onAppear(perform: {
            loadImage()
        })
    }
    
    func loadImage(){
        let inputImage = UIImage(resource: .golf7M)
        let beginImage = CIImage(image: inputImage)
        
        let contextOfCI = CIContext()
        let currentFilter = CIFilter.twirlDistortion()
        
        
        currentFilter.inputImage = beginImage
        
        let amount = 1.0
        
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey){
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey){
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey){
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
        currentFilter.radius  = 1000
        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        
        guard let outputImage = currentFilter.outputImage else {return}
        
        guard let cgImage = contextOfCI.createCGImage(outputImage, from: outputImage.extent) else {return}
        let uiImage = UIImage(cgImage: cgImage)
        
        image = Image(uiImage: uiImage)

            
        
    }
}

#Preview {
    FilterImageContent()
}


