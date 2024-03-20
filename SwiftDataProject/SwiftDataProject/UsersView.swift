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

    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }
}

#Preview {
    UsersView()
        .modelContainer(for: User.self)
}
