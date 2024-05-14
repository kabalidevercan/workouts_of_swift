//
//  BindingAndBindable.swift
//  mvvmtry
//
//  Created by Ercan Kabali on 14.05.2024.
//

import SwiftUI


struct ContentView : View {
 
    
    @State private var isToggled = false
    
    var body: some View{
        VStack {
            
            ToggleView(isToggled: $isToggled)
            
            Text("Ana gorunumdeki Durum : \(isToggled ? "Acik" : "Kapali")")
        }
    }
}



struct ToggleView: View{
    @Binding var isToggled : Bool
    
    var body: some View {
        Toggle(isOn: $isToggled, label: {
            Text("Alt gorunumdeki Durumu degistir!")
        }
        ).padding()
    }
}


#Preview {
        ContentView()
}

