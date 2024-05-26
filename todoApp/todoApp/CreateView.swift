//
//  CreateView.swift
//  todoApp
//
//  Created by Ercan Kabali on 25.05.2024.
//

import SwiftUI
import SwiftData

struct CreateView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    
    @Query private var categories : [Category]

    
    @State var todoItem = ToDoItem()
    @State var selectedCategory : Category?
    
    var body: some View {
        List{
            Section("To do title"){
                TextField("Name :",text: $todoItem.title)
            }
            
            Section("General"){
                DatePicker("Choose a date :",selection: $todoItem.timestamp)
                Toggle("Important? :",isOn: $todoItem.isCritical)
            }
            
            Section("Select A Category"){
                if categories.isEmpty {
                    ContentUnavailableView("No Categories", systemImage: "archivebox")
                }else {
                    Picker("",selection:$selectedCategory){
                        
                        ForEach(categories){category in
                            Text(category.title)
                                .tag(category as Category?)
                        }
                        
                        Text("None")
                            .tag(nil as Category?)
                    }
                    .labelsHidden()
                    .pickerStyle(.inline)
                }
            }
            
           
            Section{
                Button("Create"){
                    save()
               ////////////////////////////////////
                dismiss()
            }
                
            }
            
        }
        .navigationTitle("Create Todo")
        toolbar{
            ToolbarItem(placement: .cancellationAction){
                Button("Dismiss"){
                    dismiss()
                }
            }
            ToolbarItem(placement: .primaryAction){
                Button("Done"){
                    save()
                    dismiss()
                }
                .disabled(todoItem.title.isEmpty)
            }
        }
    }
}

private extension CreateView {
    func save(){
        context.insert(todoItem)
        todoItem.category = selectedCategory
        selectedCategory?.items?.append(todoItem)
    }
}

#Preview {
    CreateView()
        .modelContainer(for: ToDoItem.self)
}
