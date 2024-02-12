//
//  ContentView.swift
//  iExpense
//
//  Created by Ercan Kabali on 12.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 0.0
    
    
    var body: some View {
     
        Button("Tap"){
            withAnimation(.spring(duration: 1,bounce: 0.5)){
                animationAmount += 360
            }
        }
        .padding(90)
        .background(.purple)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x:0,y:1,z:0))
        }
}

#Preview {
    ContentView()
}
