//
//  CircleImage.swift
//  tests on SwiftUI
//
//  Created by Ercan Kabali on 31.01.2024.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("krem")
            .frame(width: 300,height: 300)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white,lineWidth:4 )
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
