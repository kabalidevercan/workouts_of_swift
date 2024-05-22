//
//  ContentView.swift
//  Flashzilla
//
//  Created by Ercan Kabali on 22.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }

            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Circle tapped!")
                }
        }
    }
}

#Preview {
    ContentView()
}
