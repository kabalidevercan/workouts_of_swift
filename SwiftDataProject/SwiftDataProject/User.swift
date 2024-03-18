//
//  User.swift
//  SwiftDataProject
//
//  Created by Ercan Kabali on 18.03.2024.
//

import Foundation
import SwiftData

@Model
class User{
    var name:String
    var city:String
    var joinDate:Date
    
    init(name:String,city:String,joinDate:Date){
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}