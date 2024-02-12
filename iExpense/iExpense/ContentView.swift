//
//  ContentView.swift
//  iExpense
//
//  Created by Ercan Kabali on 12.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animasyonMiktari = 1.0
    
    
    var body: some View {
                print(animasyonMiktari)
       return VStack{
            Stepper("Scale Amount",value: $animasyonMiktari.animation(
                .easeInOut(duration: 2)
                .repeatCount(2,autoreverses: true)
            ),in: 1...10)
            Spacer()
            Button("Tap Me"){
                animasyonMiktari += 1
         
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animasyonMiktari)
            Spacer()
        }
            
        
        
          }
}

#Preview {
    ContentView()
}
