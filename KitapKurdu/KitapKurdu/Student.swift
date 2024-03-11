//
//  Student.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 11.03.2024.
//

import Foundation
import SwiftData


@Model
class Student{
    var id:UUID
    var name:String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
    
}
