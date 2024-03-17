//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Ercan Kabali on 17.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack{
                Text("SwiftData")
            }
        }
    }
}

#Preview {
    ContentView()
}
