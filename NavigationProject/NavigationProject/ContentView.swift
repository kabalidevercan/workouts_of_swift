//
//  ContentView.swift
//  NavigationProject
//
//  Created by Ercan Kabali on 26.02.2024.
//

import SwiftUI


struct User:Hashable{
    let name:String
    let surname:String
    let address:String
    
    init(name:String,surname:String,address:String){
        self.name = name
        self.surname = surname
        self.address = address
        
        print("User class is working")
        
    }
}


struct ContentView: View {
    

    @State private var users = [User]()
    
    
    var body: some View {
        NavigationStack(path:$users){
            ScrollView(){
                Button("Get info for Irem"){
                    users.append(User(name: "Irem", surname: "Erdem", address: "Turkey"))
                }
                .foregroundStyle(.white)
                .frame(width:200,height: 100)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.bottom,40)
                
                Button("Create a user for Ercan"){
                    users = [User(name: "Ercan", surname: "Kabali", address: "Turkey")]
                }
                .foregroundStyle(.white)
                .frame(width: 200,height: 100)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.bottom,40)
                Button("Get information for A Team"){
                    users.append(User(name: "Mehmet", surname: "Celi", address: "Turkey"))
                    users.append(User(name: "Zaara", surname: "Khan", address: "India"))
                }
            }
            .frame(maxWidth: .infinity)
            .navigationDestination(for: User.self){selectedUser in
                Text("You are able to see about \(selectedUser.name) \(selectedUser.surname),\(selectedUser.address)")
            }
        }
    }
}
        
#Preview {
    ContentView()
}



