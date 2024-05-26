//
//  ToDo.swift
//  todoApp
//
//  Created by Ercan Kabali on 25.05.2024.
//

import Foundation
import SwiftData

@Model
class ToDoItem{
    var title:String
    var timestamp:Date
    var isCritical:Bool
    var isCompleted:Bool
    
    @Relationship(deleteRule:.nullify, inverse: \Category.items)
    var category : Category?
     
    init(title: String = "", timestamp: Date = .now, isCritical: Bool = false, isCompleted: Bool = false) {
        self.title = title
        self.timestamp = timestamp
        self.isCritical = isCritical
        self.isCompleted = isCompleted
    }
    
}
