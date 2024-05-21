//
//  ContentView.swift
//  HotProspects
//
//  Created by Ercan Kabali on 20.05.2024.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @AppStorage("emailAdress") private var emailAdress = "ercankabali@gmail.com"
    @AppStorage("username") private var username = "hocaercan"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    
    var body: some View{
        NavigationStack{
            Form{
                TextField("Name:" ,text: $username)
                    .textContentType(.username)
                    .font(.title)
                TextField("Mail adresiniz:",text: $emailAdress)
                    .textContentType(.emailAddress)
                    .font(.title)
                Image(uiImage: generateQRCode(getString: "\(username)\n\(emailAdress)"))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200,height: 200)
            }
        }
        
    }
    
    func generateQRCode(getString: String) -> UIImage {
        filter.message = Data(getString.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent){
                return UIImage(cgImage: cgImage)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
}

#Preview {
    ContentView()
}
