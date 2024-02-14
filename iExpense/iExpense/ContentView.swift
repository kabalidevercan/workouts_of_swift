//
//  ContentView.swift
//  iExpense
//
//  Created by Ercan Kabali on 12.02.2024.
//

import SwiftUI



struct SecondView:View{
    var name:String
    @Environment(\.dismiss) var dismiss
    
    var body:some View{
        Button("Dismiss"){
            dismiss()
        }
    
            
    }
}


struct ContentView: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    func removeRows(at offsets : IndexSet){
        numbers.remove(atOffsets: offsets)
    }

    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(numbers,id: \.self){
                        Text("Row \($0)")
                        
                    }
                    .onDelete(perform: removeRows)
                    
                    
                }
                
                
                Button("Add Plus Number"){
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                
            }
            .toolbar{
                EditButton()
            }
            
            
        }
        

    }
    
    
    
    
}

#Preview {
    ContentView()
}
