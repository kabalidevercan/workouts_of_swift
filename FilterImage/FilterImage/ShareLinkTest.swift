//
//  ShareLinkTest.swift
//  FilterImage
//
//  Created by Ercan Kabali on 1.04.2024.
//

import SwiftUI

struct ShareLinkTest: View {
    let exampleForImage = Image(.golf7M)
    
    var body: some View {
        
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift here"), message: Text("Check out the 100 Days of SwiftUI!"))
        
        
        
        ShareLink(item: exampleForImage,preview: SharePreview("Golf Araba",image:exampleForImage )){
            Label("Click to share GOLF",systemImage: "car")
        }
        
        ShareLink(item:exampleForImage,preview: SharePreview("SDSD", image: exampleForImage))
        {
            Label("Click to share",systemImage: "car")
        }
        
    }
    
    
}

#Preview {
    ShareLinkTest()
}
