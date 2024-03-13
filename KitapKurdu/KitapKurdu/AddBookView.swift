//
//  AddBookView.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 11.03.2024.
//

import SwiftUI
import SwiftData


struct AddBookView: View {
    
    @Environment(\.modelContext) var contextOfModel
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }

                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        contextOfModel.insert(newBook)
                        dismiss()
                        // add the book
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
