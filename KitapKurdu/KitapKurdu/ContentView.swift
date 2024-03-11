//
//  ContentView.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 10.03.2024.
//

import SwiftUI


struct PushButton : View {
    let title:String
    @Binding var isOn:Bool
    
    var onColors = [Color.red,Color.yellow]
    var offColors = [Color(white:0.6),Color(white:0.4)]
    
    
    var body: some View{
        Button(title){
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
        
    }
    
    
}

struct ContentView: View {
    @State private var rememberMe = false
    @AppStorage("notes") private var  notes = ""
    
    
    var body: some View {
        
        NavigationStack{
            
                TextEditor(text: $notes)
                TextField("ERER", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .navigationTitle("sdsd")
            
                
        }
           
            
        
    }
}

#Preview {
    ContentView()
}
