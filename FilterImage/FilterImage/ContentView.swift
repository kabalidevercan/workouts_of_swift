//
//  ContentView.swift
//  FilterImage
//
//  Created by Ercan Kabali on 21.03.2024.
//

import SwiftUI

struct ContentView: View {

    @State private var stateOfValue = false
    @State private var colorOfBackground = Color.black
    var body: some View {
        Button("Hello World"){
            stateOfValue = true
        }
        .frame(width: 300,height: 300)
        .background(colorOfBackground)
        .confirmationDialog("Change background", isPresented: $stateOfValue){
            Button("Color to red"){
                colorOfBackground = .red
            }
            Button("Color to green"){
                colorOfBackground = .green
            }
            Button("Color to purple"){
                colorOfBackground = .purple
            }
            Button("Color to cyan"){
                colorOfBackground = .cyan
            }
        }message: {
            Text("Select NEW COLOR!!")
        }
    }
}

#Preview {
    ContentView()
}
