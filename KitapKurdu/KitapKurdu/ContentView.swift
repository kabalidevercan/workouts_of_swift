//
//  ContentView.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 10.03.2024.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) var contextOfModel
    @Query var books:[Book]
    
    @State private var showingAddScreen = false
    
    
    
    var body: some View{
        NavigationStack{
            Text("Book Count: \(books.count)")
                .navigationTitle("Kitap Kurdu")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add Book",systemImage: "plus"){
                            showingAddScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView()
                })
        }
        
    }
}

#Preview {
    ContentView()
}
