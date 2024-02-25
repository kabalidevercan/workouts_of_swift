//
//  StrokeTest.swift
//  MoonShot
//
//  Created by Ercan Kabali on 25.02.2024.
//

import SwiftUI

struct StrokeTest: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.red)
            .frame(width: 200,height: 200)
            
    }
}

#Preview {
    StrokeTest()
}
