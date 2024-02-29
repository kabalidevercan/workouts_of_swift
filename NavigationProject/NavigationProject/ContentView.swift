//
//  ContentView.swift
//  NavigationProject
//
//  Created by Ercan Kabali on 26.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0,path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number:i, path: $path)
            }
        }
    }
}

struct DetailView: View {
    var number: Int
    
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar{
                Button("Back Home"){
                    path = NavigationPath()
                }
            }
            
    }
}


    

        
#Preview {
    ContentView()
}



