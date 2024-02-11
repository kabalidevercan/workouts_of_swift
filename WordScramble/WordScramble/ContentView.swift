//
//  ContentView.swift
//  WordScramble
//
//  Created by Ercan Kabali on 10.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = "test"
    @State private var newWord = ""
    var body: some View {
        NavigationStack{
            List{
                Section{
                    TextField("Enter your word", text: $newWord)
                }
                Section{
                    ForEach(usedWords,id: \.self){ word in
                        Text(word)
                        
                    }
                }
            }
            .navigationTitle(rootWord)
        }
       
    }
}

#Preview {
    ContentView()
}
