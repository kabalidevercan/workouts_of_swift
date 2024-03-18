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
            TextField("Name:", $user.name)
            TextField("Address:",$user.city)
            DatePicker("Date:",selection: $user.joinDate)
        }
        .navigationTitle("Edit")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {

    do{
        let confi = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: User.self, configurations: confi)
        let newUser = User(name: "Ercan", city: "Tekirdag", joinDate: .now)
        
        return EditUserView(user: newUser)
            .modelContainer(modelContainer)
        
    }catch{
        print("Error 30.row in EditUserView \(error.localizedeDd)")
    }
    
    
    EditUserView()
}
