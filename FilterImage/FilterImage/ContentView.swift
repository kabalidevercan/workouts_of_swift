//
//  ContentView.swift
//  FilterImage
//
//  Created by Ercan Kabali on 21.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var processedImage : Image?
    @State private var filterIntensity = 0.5
    
    
    var body: some View {
        NavigationStack{
            VStack{
                
                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView{
                        Label("No Picture",systemImage: "photo.badge.plus")
                    }description: {
                        Text("There is nothing")
                    }actions: {
                        Button("Download A Pic"){
                            
                        }
                        .buttonStyle(.borderedProminent)
                        
                    }
                }
                //image area
            }
            Spacer()
            HStack{
                Text("Intensity")
                Slider(value: $filterIntensity)
            }
            .padding(.vertical)
            HStack{
                Button("Change Filter"){
                    //change filter
                }
                .buttonStyle(.borderedProminent)
                Spacer()
                
                //share the picture
            }
            
        }
        .padding([.horizontal,.bottom])
        .navigationTitle("InstaFilter")
        
    }
}

#Preview {
    ContentView()
}
