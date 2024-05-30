//
//  KitapDostumApp.swift
//  KitapDostum
//
//  Created by Ercan Kabali on 26.05.2024.
//

import SwiftUI
import SwiftData

@main
struct KitapDostumApp: App {
    let container: ModelContainer
    
    
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(container)
        //.modelContainer(for: Book.self)
    }
    
    
    init() {
        let schema = Schema([Book.self])
        let config = ModelConfiguration("MyBooks",schema: schema)
        
        do {
            container = try ModelContainer(for: schema, configurations: config)
        }catch {
            fatalError("Could not configure the container")
        }
    }
}

