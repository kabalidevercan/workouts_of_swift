//
//  ContentView.swift
//  WordScramble
//
//  Created by Ercan Kabali on 10.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            ForEach(0..<5){
                Text("Data from row of \($0)")
            }
        }
    }
}

#Preview {
    ContentView()
}
