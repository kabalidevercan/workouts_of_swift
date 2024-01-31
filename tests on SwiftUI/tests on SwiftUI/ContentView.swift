//
//  ContentView.swift
//  tests on SwiftUI
//
//  Created by Ercan Kabali on 30.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            CircleImage()
                .offset(y:-130)
                .padding(.bottom,-130)
            VStack(alignment:.leading) {
                Text("KBL Software")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        
                    Spacer()
                    Text("California")
                        
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Divider()
                Text("About Kabali Software")
                    .font(.title2)
                Text("Descriptive goes")
                
            }.padding()
            Spacer()
        }
            
        
        
    }
}

#Preview {
    ContentView()
}
