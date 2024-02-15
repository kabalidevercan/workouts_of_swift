//
//  ContentView.swift
//  iExpense
//
//  Created by Ercan Kabali on 12.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    
    
    var body: some View{
        NavigationStack{
                List{
                    ForEach(expenses.items){item in
                        Text(item.name)
                        
                    }
                    .onDelete(perform: removeExpense)
                }
                .navigationTitle("iExpense")
                .toolbar{
                    Button("Add Expense",systemImage: "plus.app.fill"){
                        let expense = ExpenseItem(name: "Test", type: "Personel", amount: 5 )
                        expenses.items.append(expense)
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
