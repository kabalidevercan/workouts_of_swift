//
//  DetailView.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 12.03.2024.
//

import SwiftUI
import SwiftData


struct DetailView: View {
    
    let book:Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()

                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)

            Text(book.review)
                .padding()

            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)

    }
}


#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: Book.self, configurations: config)
        let example =  Book(title: "Nasrettin", author: "Ercan", genre: "Horror", review: "this was great a book that is first time in my life", rating: 3)
        
        return DetailView(book: example)
            .modelContainer(modelContainer)
        
    }catch{
        return Text("Failed to preview on \(error.localizedDescription)")
    }
}
