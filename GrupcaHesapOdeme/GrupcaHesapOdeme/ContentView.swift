//
//  ContentView.swift
//  GrupcaHesapOdeme
//
//  Created by Ercan Kabali on 4.02.2024.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused:Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10,15,20,25,0]
    var totalPerPerson:Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let totalValue = checkAmount + tipValue
        let perValue = totalValue / peopleCount
        return perValue
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount",value: $checkAmount,format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number Of People:",selection: $numberOfPeople){
                        ForEach(2..<100){value in
                            Text("\(value)")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("Amount Per Person") {
                    Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                }
                Section("How much tip do you want to leave? ") {
                    Picker("Tip Percentage: ",selection: $tipPercentage){
                        ForEach(tipPercentages,id: \.self){
                            Text($0, format:.percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    
                }
            }
                .navigationTitle("Alman Usulü")
                .toolbar{
                    if amountIsFocused {
                        Button("Done"){
                            amountIsFocused = false
                        }
                    }
                }
        }
        
            
        }
    }


#Preview {
    ContentView()
}
