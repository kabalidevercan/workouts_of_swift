//
//  KitapKurduApp.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 10.03.2024.
//

import SwiftUI
import SwiftData

@main
struct KitapKurduApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
        
    }
}
