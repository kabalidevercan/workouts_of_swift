//
//  ContentView.swift
//  FellowTraveller
//
//  Created by Ercan Kabali on 5.04.2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        if Bool.random(){
            Rectangle()
                .frame(width: 200,height: 400)
        } else {
            Circle()
                .frame(width: 200,height: 400)
        }
        
        Button("Read and Write"){
            print(URL.desktopDirectory)
            let data = Data("DENEME YAZI".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do{
                try data.write(to: url,options: [.atomic,.completeFileProtection])
                let input  = try String(contentsOf: url)
                print(input)
            }catch{
                print(error.localizedDescription)
            }
        }
        .buttonStyle(.borderedProminent)
    }
}



#Preview {
    ContentView()
}
