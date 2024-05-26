//
//  CreateCategoryView.swift
//  todoApp
//
//  Created by Ercan Kabali on 26.05.2024.
//

import SwiftUI
import SwiftData

@Model
class Category {
    
    @Attribute(.unique)
    var title :String
    
    var items : [ToDoItem]?
    
    init(title: String = "") {
        self.title = title
    }
}


struct CreateCategoryView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    
    @Query private var categories : [Category]
    
    @State private var title:String = ""
    
    
    
    var body: some View {
        List{
            Section("Category Title"){
                TextField("Enter title here: ",text: $title)
                Button("Add Category"){
                    withAnimation{
                        let category = Category(title: title)
                        context.insert(category)
                        category.items = []
                        title = ""
                    }
                }
                .disabled(title.isEmpty)
            }
            
            Section("Categories"){
                if categories.isEmpty {
                    ContentUnavailableView("No Categories",systemImage: "archivebox")
                    
                }else {
                    ForEach(categories){category in
                        Text(category.title)
                            .swipeActions{
                                Button(role: .destructive){
                                    withAnimation{
                                        context.delete(category)
                                    }
                                }label: {
                                    Label("Delete",systemImage: "trash.fill")
                                }
                            }
                    }
                }
            }
        }
        .navigationTitle("Add Category")
        .toolbar{
            ToolbarItem(placement: .cancellationAction){
                Button("Dismiss"){
                    dismiss()
                }
            }
        }
        
        
    }
}

#Preview {
    NavigationStack{
        CreateCategoryView()
    }
}
