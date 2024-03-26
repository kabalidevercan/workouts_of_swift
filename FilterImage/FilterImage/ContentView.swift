//
//  ContentView.swift
//  FilterImage
//
//  Created by Ercan Kabali on 21.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var amountOf = 0.0 {
        didSet{
            print("Worked\(amountOf)")
        }
    }
    
    @State private var watchingNewValue  = 0.0 {
        didSet{
            print("\(watchingNewValue) works fine")
        }
    }
    
    var body: some View {
        
        VStack{
            Text("New Text")
                .blur(radius: watchingNewValue)
            Slider(value: $watchingNewValue,in: 0...20)
                .onChange(of: watchingNewValue){oldValue,newValue in
                        print("old value is: \(oldValue)")
                        print("new value is: \(newValue)")
                }
            
            Button("Change the value",systemImage: "arrow.down.arrow.up"){
                watchingNewValue = Double.random(in: 0...20)
            }
        }
        
        VStack {
            Text("Hello Society")
                .blur(radius: amountOf)
            Slider(value: $amountOf,in: 0...20)
            
            Button("Random Blur"){
                amountOf = Double.random(in: 0...20)
            }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
