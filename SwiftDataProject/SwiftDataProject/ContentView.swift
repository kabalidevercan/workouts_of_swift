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
    @State private var showingUpComingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    
    var body: some View {
        NavigationStack(path: $path) {
            UsersView(minimumJoinDate: showingUpComingOnly ? .now : .distantPast,sortOrder: sortOrder)
                .navigationTitle("Users")
                .navigationDestination(for: User.self) { user in
                    EditUserView(user: user)
                }
                .toolbar{
                    //Button("Add random user"){
                       /// let newUser = User(name: "", city: "", joinDate: .now)
                       // contextOfModel.insert(newUser)
                   //     //path = [newUser]
                   // }
                   // Button("Add Samples", systemImage: "plus") {
                        
                       // try? contextOfModel.delete(model:User.self)
                       //
                       // let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                       // let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                       // let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                       // let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                        
                       // contextOfModel.insert(first)
                       // contextOfModel.insert(second)
                       // contextOfModel.insert(third)
                      //  contextOfModel.insert(fourth)
                 //   }
                   // Button(showingUpComingOnly ? "Show Everyone" : "Show Upcoming"){
                        //showingUpComingOnly.toggle()
                    //}
                    Menu("Sort",systemImage: "arrow.up.arrow.down"){
                        Picker("Sort",selection: $sortOrder){
                            Text("Sort by name")
                                .tag([
                                    SortDescriptor(\User.name),
                                    SortDescriptor(\User.joinDate)
                                ])
                            Text("Sort by Join date")
                                .tag([
                                    SortDescriptor(\User.joinDate),
                                    SortDescriptor(\User.name),
                                ])
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        
}
