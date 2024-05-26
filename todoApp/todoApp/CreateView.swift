//
//  CreateView.swift
//  todoApp
//
//  Created by Ercan Kabali on 25.05.2024.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var todoItem = ToDoItem()
    
    var body: some View {
        List{
            TextField("Name :",text: $todoItem.title)
            DatePicker("Choose a date :",selection: $todoItem.timestamp)
            Toggle("Important? :",isOn: $todoItem.isCritical)
            Button("Create"){
                withAnimation{
                    context.insert(todoItem)
                }
                
                dismiss()
            }
        }
        .navigationTitle("Create Todo")
    }
}

#Preview {
    CreateView()
        .modelContainer(for: ToDoItem.self)
}
