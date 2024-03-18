//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Ercan Kabali on 17.03.2024.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
