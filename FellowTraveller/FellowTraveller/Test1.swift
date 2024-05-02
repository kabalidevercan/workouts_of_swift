//
//  Test1.swift
//  FellowTraveller
//
//  Created by Ercan Kabali on 29.04.2024.
//

import SwiftUI

struct Test1: View {
    
    //Codable,Equatable,Identifiable
    
    let users = [
        User(firstName: "Ercan", lastName: "Kabali"),
        User(firstName: "Mehmet", lastName: "Kadikoy"),
        User(firstName: "Ayse", lastName: "Selmanturk")
    ].sorted()
    var body: some View {
        Button("Read and Write"){
            let data = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url,options: [.atomic,.completeFileProtection])
                let input  = try String(contentsOf: url)
                print(input)
            }catch {
                print(error.localizedDescription)
            }
            
            
        }
        
    }
}

//Codable,Equatable,Identifiable

struct User: Identifiable ,Comparable{
    let id = UUID()
    let firstName: String
    let lastName:String
    
    static func <(lhs:User, rhs:User)-> Bool{
        lhs.lastName < rhs.lastName
    }
}

#Preview {
    Test1()
}
