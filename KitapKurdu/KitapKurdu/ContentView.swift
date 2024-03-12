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
    @State private var number = 4
    
    @State private var showingAddScreen = false
    @State private var showingSecondScreen = false
    
    
    var body: some View{
        NavigationStack{
            List{
                ForEach(books){book in
                    NavigationLink(value: book){
                        HStack{
                            EmojiRating(number: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading){
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    
                }

                
            }
            .navigationDestination(for: Book.self){book in
                    DetailView(book: book)
            }
            
            
                .navigationTitle("Kitap Kurdu")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add Book",systemImage: "plus"){
                            showingAddScreen.toggle()
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add Smile", systemImage:"plus"){
                            showingSecondScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView()
                })
                .sheet(isPresented: $showingSecondScreen){
                    SmileViewRating(rate: $number)
                }
        }
        
    }
}

#Preview {
    ContentView()
}
