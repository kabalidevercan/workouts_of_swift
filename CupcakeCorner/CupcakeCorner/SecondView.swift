//
//  SecondView.swift
//  CupcakeCorner
//
//  Created by Ercan Kabali on 5.03.2024.
//

import SwiftUI

struct SecondView: View {
    @State private var counter = 0
    
    var body: some View {
  
        Button("Tap Count: "){
            counter += 1
        }
        .sensoryFeedback(.impact(weight: .heavy,intensity: 1), trigger: counter)
        
    }

}

#Preview {
    SecondView()
}


@Observable
class User:Codable{
    
    enum CodingKeys:String,CodingKey {
        case _name = "name"
    }
    
    
    var name = "Ercan"
    
}
