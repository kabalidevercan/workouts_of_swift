//
//  ContentView.swift
//  todoApp
//
//  Created by Ercan Kabali on 25.05.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showCreateToDo = false
    @State private var toDoEdit: ToDoItem?
    @State private var showCreateCategory = false
    @State private var searchQuery = ""
    
    @Query private var items : [ToDoItem]
    
    @Environment(\.modelContext) var context
    
    var filteredItems : [ToDoItem] {
        
        if searchQuery.isEmpty {
            return items
        }
        
        let filtereditem = items.compactMap{ item in
            let titleContainsQuery = item.title.range(of: searchQuery,
                                                       options : .caseInsensitive
            ) != nil
            
            return titleContainsQuery ? item : nil
        }
        
        return filtereditem
    }
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(items){item in
                    HStack {
                        VStack(alignment: .leading){
                         
                            
                            if item.isCritical {
                                Image(systemName: "exclamationmark.3")
                                    .symbolVariant(.fill)
                                    .foregroundColor(.red)
                                    .font(.largeTitle)
                                    .bold()
                            }
                            
                            Text(item.title)
                                .font(.largeTitle)
                                .bold()
                            
                            Text("\(item.timestamp,format: Date.FormatStyle(date: .numeric,time: .shortened))")
                            
                            if let category = item.category {
                                Text(category.title)
                                    .foregroundStyle(Color.blue)
                                    .bold()
                                    .padding(.horizontal)
                                    .padding(.vertical, 8) 
                                    .background(Color.blue.opacity(0.1),in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                            }
                            
                        }
                        Spacer()
                        Button{
                            withAnimation{
                                item.isCompleted.toggle()
                            }
                        }label: {
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundColor(item.isCompleted ? .green : .gray)
                                .font(.largeTitle)
                        }
                        .buttonStyle(.plain)
                        
                    }
                    .swipeActions{
                        Button(role: .destructive){
                            withAnimation{
                                context.delete(item)
                            }
                            
                        }label : {
                            Label("Delete",systemImage: "trash")
                                .symbolVariant(.fill)
                        }
                        
                        Button{
                            toDoEdit = item
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.orange)
                        
                    }
                }
            }
                
            .navigationTitle("My To Do List")
            .searchable(text: $searchQuery,prompt:"Search for a to do or a category")
                .sheet(isPresented: $showCreateToDo, content: {
                    NavigationStack{
                        CreateView()
                    }
                    .presentationDetents([.medium])
                })
                .sheet(item: $toDoEdit,
                       onDismiss: {
                        toDoEdit = nil
                },
                       content: {editItem in
                    NavigationStack{
                        UpdateToDoView(item: editItem)
                            .interactiveDismissDisabled()
                    }
                }
            )
                .sheet(isPresented: $showCreateCategory, content: {
                    NavigationStack{
                        CreateCategoryView()
                    }
                })
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("New Category"){
                            showCreateCategory.toggle()
                        }
                    }
                }
                .safeAreaInset(edge: .bottom , alignment: .leading){
                    Button(action: {
                        showCreateToDo.toggle()
                    },label : {
                        Label("New ToDo",systemImage: "plus")
                            .bold()
                            .font(.title2)
                            .padding(8)
                            .background(.gray.opacity(0.1),in:Capsule())
                            .padding(.leading)
                            .symbolVariant(.circle.fill)
                    })
                }
                        
        }
    }
}

#Preview {
    ContentView()
}
