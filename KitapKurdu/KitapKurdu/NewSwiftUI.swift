//
//  NewSwiftUI.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 13.03.2024.
//

import SwiftUI

struct NewSwiftUI: View {
    @State private var selectedNumber = 0
    let numbersForView = [1,2,3,4,5]
    @State private var rastgeleNumber = 4
    
    
    var body: some View {
        NavigationStack{
            Form{
                Picker("Select a number:",selection: $selectedNumber){
                    ForEach(numbersForView,id: \.self){number in
                            Text("\(number)")
                    }
                }
                EmojiRating(numberOfRate: $selectedNumber, number: $rastgeleNumber)
            }
           
        }
        
    }
}

#Preview {
    NewSwiftUI()
}
