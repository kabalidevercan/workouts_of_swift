//
//  ContentView.swift
//  NavigationProject
//
//  Created by Ercan Kabali on 26.02.2024.
//

import SwiftUI


struct TestInHashable : Hashable{
    let text:String
    let subtext:String
    

    func hash(into hasher: inout Hasher) {
        hasher.combine(text + subtext)
    }
    
    
    
}

struct ContentView: View {
    
   let obj1 = TestInHashable(text: "mehmet", subtext: "selman")
    let obj2 = TestInHashable(text: "mehmet", subtext: "seman")
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text(obj1.hashValue.description)
                    Spacer()
                    Text(obj2.hashValue.description)
                    
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}



