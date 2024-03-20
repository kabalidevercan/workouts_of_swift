//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Ercan Kabali on 17.03.2024.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) var contextOfModel
    @State private var path = [User]()
    
    @Query(filter:#Predicate<User> {user in
        if user.name.localizedStandardContains("R"){
            if user.city == "London" {
                return true
            }else {
                return false
            }
        }else {
            return false
        }
    },sort:\User.name) var users:[User]
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar{
                Button("Add User"){
                    let newUser = User(name: "", city: "", joinDate: .now)
                    contextOfModel.insert(newUser)
                    path = [newUser]
                }
                Button("Add Samples", systemImage: "plus") {
                            
                    try? contextOfModel.delete(model:User.self)
                    
                           let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                           let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                           let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                           let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                           contextOfModel.insert(first)
                           contextOfModel.insert(second)
                           contextOfModel.insert(third)
                           contextOfModel.insert(fourth)
                       }
            }
        }
    }
}

#Preview {
    ContentView()
        
}
