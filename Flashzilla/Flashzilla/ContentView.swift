//
//  ContentView.swift
//  Flashzilla
//
//  Created by Ercan Kabali on 22.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            HStack{
                Text("KBL")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("Yazılım")
                    .font(.caption)
                    .fontWeight(.heavy)
                
            }
            
            
            Text("Teknoloji ve Dijital Dönüşüm Dostunuz: İhtiyaçlarınızı Teknolojiyle Buluşturuyoruz...")
                .frame(width: 300,height:100,alignment: .leading)
                
        }
        
    }
}

#Preview {
    ContentView()
}
