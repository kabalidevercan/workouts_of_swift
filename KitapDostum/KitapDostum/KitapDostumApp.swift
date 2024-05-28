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
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(for: Book.self)
    }
    
    init(){
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}

