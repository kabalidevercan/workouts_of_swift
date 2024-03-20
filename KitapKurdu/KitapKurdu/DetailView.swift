//
//  DetailView.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 12.03.2024.
//

import SwiftUI
import SwiftData


struct DetailView: View {
    @Environment(\.modelContext) var contextOfModel
    @Environment(\.dismiss) var dismiss
    @State private var showingAlertMessage = false
    
    let book:Book
    
    func deleteBook(){
        contextOfModel.delete(book)
        dismiss()
    }
    
    func SetDate(date:Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter.string(from: date)
    }
    
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
            
          Text("Published Date:\(SetDate(date:book.publishDate))")
              .padding(.top,20)
                
        }
        .toolbar{
            ToolbarItem(placement:.topBarTrailing){
                Button("Delete this book",systemImage: "trash"){
                    showingAlertMessage = true
                }
            }
        }
        .alert("Delete Book",isPresented: $showingAlertMessage){
            Button("Delete",role: .destructive,action: deleteBook)
            Button("Cancel",role: .cancel,action: {})
        }message: {
            Text("Are you sure deleting this book")
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
