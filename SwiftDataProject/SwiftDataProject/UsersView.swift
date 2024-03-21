//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Ercan Kabali on 20.03.2024.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]
    @Environment(\.modelContext) var contextOfModel


    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func addSample(){ 
        let user1 = User(name: "Ercan", city: "Corlu", joinDate: .now.addingTimeInterval(86400 * 2))
        let job1 = Job(name: "Cukur kazmak", priority: 2)
        let job2 = Job(name: "Elma toplamak", priority: 1)
        
        contextOfModel.insert(user1)
        
        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
    
    
    var body: some View {
        List(users) { user in
            HStack{
                Text(user.name)
                Spacer()
                Text(String(user.jobs.count))
                    .fontWeight(.black)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .onAppear(perform: {
            addSample()
        })
    
    }
}

#Preview {

    UsersView(minimumJoinDate: .now,sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
    
}
