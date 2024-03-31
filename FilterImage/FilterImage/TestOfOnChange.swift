//
//  TestOfOnChange.swift
//  FilterImage
//
//  Created by Ercan Kabali on 31.03.2024.
//

import SwiftUI

struct TestOfOnChange: View {
    @State private var titleForText = "This text will be gone"
    @State private var valueOfNumber = 0.0{
        didSet{
            print("\(valueOfNumber) works great")
        }
    }
    
    var body: some View {
        Text(titleForText)
            .blur(radius: valueOfNumber)

        Button("Change the blur of \(titleForText)"){
            let newRandomDoubleValue = Double.random(in: 0...20)
            valueOfNumber = newRandomDoubleValue
        }
        
        Slider(value: $valueOfNumber,in: 0...20)
            .onChange(of: valueOfNumber){oldValue,newValue in
                print("Old value is:\(oldValue)")
                print("New value is:\(newValue)")
            }
        
        
        
            
    }
}

#Preview {
    TestOfOnChange()
}
