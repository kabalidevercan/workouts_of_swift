//
//  ContentView.swift
//  GrupcaHesapOdeme
//
//  Created by Ercan Kabali on 4.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        @State private var checkAmount = 0.0
        @State private var numberOfPeople = 2
        @State private var tipPercentage = 20
        
        let tipPercenages = [0,10,15,20,25]
        
        Form {
            Section {
                TextField("Amount",value: $checkAmount,format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            Section {
                Text(checkAmount,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
            }
        }
    }
}

#Preview {
    ContentView()
}
