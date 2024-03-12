//
//  SmileViewRating.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 12.03.2024.
//

import SwiftUI

struct SmileViewRating: View {
    @Binding var rate:Int
    
    
    let image = Image(systemName: "face.smiling.inverse")
    let maxRate = 5
    
    let offColor = Color.gray
    let onColor = Color.yellow
    
    var body: some View {
        HStack{
            ForEach(1..<maxRate +  1,id: \.self){number in
                Button{
                    rate = number
                }label: {
                    image
                        .foregroundStyle(number > rate ? .gray : .yellow)
                }
            }
        }
        .buttonStyle(.plain)
    }
}
#Preview {
    SmileViewRating(rate: .constant(4))
}
