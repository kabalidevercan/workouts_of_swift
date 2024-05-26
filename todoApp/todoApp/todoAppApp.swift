//
//  todoAppApp.swift
//  todoApp
//
//  Created by Ercan Kabali on 25.05.2024.
//

import SwiftUI
import SwiftData

@main
struct todoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
