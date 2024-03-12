//
//  EmojiRating.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 12.03.2024.
//

import SwiftUI

struct EmojiRating: View {
    
    var number:Int
    
    
    
    
    var body: some View {
        switch number{
        case 1:
            Text("1")
        case 2:
            Text("2")
        case 3:
            Text("3")
        case 4:
            Text("4")
        default:
            Text("5")
            
        }
    }
}

#Preview {
    EmojiRating(number: 4)
}
