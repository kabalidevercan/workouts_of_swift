//
//  ContentView.swift
//  iExpense
//
//  Created by Ercan Kabali on 12.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    
    var body: some View{
        NavigationStack{
                List{
                    ForEach(expenses.items){item in
                        HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }

                                Spacer()
                                Text(item.amount, format: .currency(code: "USD"))
                            }
                    }
                    .onDelete(perform: removeExpense)
                }
                .navigationTitle("iExpense")
                .sheet(isPresented: $showingAddExpense, content: {
                    AddView(expenses:expenses)
                })
                .toolbar{
                    Button("Add Expense",systemImage: "plus.app.fill"){
                        showingAddExpense =  true
                    }
                }
                .toolbar{
                    EditButton()
                }
                
                
            
        }
      
      
      
    }
    
    func removeExpense (at offSet:IndexSet){
        expenses.items.remove(atOffsets: offSet )
    }
    
    
}

#Preview {
    ContentView()
}
