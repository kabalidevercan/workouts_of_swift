//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by Ercan Kabali on 18.03.2024.
//

import SwiftUI
import SwiftData

struct EditUserView: View {
    @Bindable var user : User
    
    var body: some View {
        Form{
            TextField("Name:", text: $user.name)
            TextField("Address:",text: $user.city)
            DatePicker("Date:",selection: $user.joinDate)
        }
        .navigationTitle("Edit")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {

    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let containerOfModel = try ModelContainer(for: User.self, configurations: config)
        let newUser = User(name: "Ercan", city: "Tekirdag", joinDate: .now)
        
        return EditUserView(user: newUser)
            .modelContainer(containerOfModel)
        
    }catch{
        return Text("ERRORRRRRR \(error.localizedDescription)")
    }
    
}






