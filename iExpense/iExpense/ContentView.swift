//
//  ContentView.swift
//  iExpense
//
//  Created by Ercan Kabali on 12.02.2024.
//

import SwiftUI

@Observable
class User{
    var firstName = "Ercan"
    var lastName = "Kabali"
}

struct ContentView: View {
    @State private var user = User()

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

#Preview {
    ContentView()
}
