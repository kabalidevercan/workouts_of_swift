//
//  ContentView.swift
//  MoonShot
//
//  Created by Ercan Kabali on 21.02.2024.
//

import SwiftUI

struct ContentView : View{
    
    let astronauts = Bundle.main.decode("astronauts.json")
    
    
   
    var body: some View{
        Text(String(astronauts.count))
    }
}


#Preview {
    ContentView()
}
    


