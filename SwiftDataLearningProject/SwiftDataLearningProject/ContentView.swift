//
//  ContentView.swift
//  SwiftDataLearningProject
//
//  Created by Ercan Kabali on 14.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = AnaSayfaViewModel()
    
    @State private var textField1 = ""
    @State private var textField2 = ""
    
    
    
    var body: some View {
        VStack(spacing:50){
            VStack(spacing:20){
                TextField("number1: ",text: $textField1).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                TextField("number2: ",text: $textField2).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            }
            HStack(spacing:20){
                Button("Topla"){
                    viewModel.toplam(number1: Int(textField1), number2: Int(textField2))
                }
                Button("Carp"){
                    viewModel.carp(number1: Int(textField1), number2: Int(textField2))
                }
            }
            ZStack{
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 200,height: 100)
                    
                Text("Sonuc:\(viewModel.sonuc)")
            }
            
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
