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
    @Query(sort:[
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author,order: .reverse)
    ]) var books : [Book]
    @State private var number = 4
    @State private var showingAddScreen = false
    @State private var showingSecondScreen = false
    
    func deleteBooks(at offsets:IndexSet){
        for offset in offsets {
            let book  = books[offset]
            
            contextOfModel.delete(book)
        }
    }
    
    
    var body: some View{
        NavigationStack{
            List{
                ForEach(books){book in
                    NavigationLink(value: book){
                        HStack{
                                //emojirating sayfasi buraya gelecek
                            NewEmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading){
                                if book.rating == 1 {
                                    Text(book.title)
                                        .foregroundStyle(.red)
                                        .font(.headline)
                                }else{
                                    Text(book.title)
                                        .font(.headline)
                                }
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    
                }
                .onDelete(perform:deleteBooks)

                
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
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                    /*
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add Smile", systemImage:"plus"){
                            showingSecondScreen.toggle()
                        }
                    }
                     */
                }
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView()
                })
            /*
                .sheet(isPresented: $showingSecondScreen){
                    SmileViewRating(rate: $number)
                }
             */
        }
        
    }
}

#Preview {
    ContentView()
}
