//
//  Gulpembe.swift
//  FilterImage
//
//  Created by Ercan Kabali on 26.03.2024.
//

import SwiftUI



struct Gulpembe: View {
    @State private var numberOf = 0.0 {
        didSet{
            print("\(numberOf) works great")
        }
    }
    
    var body: some View {
        VStack{
            Text("This text will be blur")
                .blur(radius: numberOf)
            
            Button("Changee the value of blur text"){
                let newNumber = Double.random(in: 0...20)
                numberOf = newNumber
            }
            
            Slider(value: $numberOf,in: 0...10)
                .onChange(of: numberOf){oldValue,newValue in
                        print("\(oldValue) is work great")
                        print("\(newValue) is also work great")
                }
        }
            
    }
}

#Preview {
    Gulpembe()
}
