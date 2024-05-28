//
//  ContentView.swift
//  KitapDostum
//
//  Created by Ercan Kabali on 26.05.2024.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @State private var createNewBook = false
    @Query(sort: \Book.title) private var books : [Book]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            Group {
                if books.isEmpty {
                    ContentUnavailableView("Enter your first book", systemImage: "book.fill")
                }else {
                    List{
                        ForEach(books){book in
                            NavigationLink{
                                EditBookView(book:book)

                            }label: {
                                HStack(spacing:10){
                                    book.icon
                                    VStack(alignment: .leading){
                                        Text(book.title)
                                            .font(.title2)
                                        Text(book.author)
                                            .foregroundStyle(.secondary)
                                        if let rating = book.rating {
                                            
                                            HStack {
                                                ForEach(0..<rating, id:\.self){_ in
                                                        Image(systemName: "star.fill")
                                                        .imageScale(.small)
                                                        .foregroundStyle(.yellow)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .onDelete{indexSet in
                            indexSet.forEach { index in
                                    let book = books[index]
                                context.delete(book)
                            }
                        }
                    }
                    .listStyle(.plain)
                }

            }
            .navigationTitle("My Books")
            .toolbar{
                Button{
                    createNewBook = true
                }label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $createNewBook){
                NewBookView()
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    BookListView()
        .modelContainer(for: Book.self,inMemory: true )
}
