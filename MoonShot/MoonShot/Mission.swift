//
//  Mission.swift
//  MoonShot
//
//  Created by Ercan Kabali on 24.02.2024.
//

import Foundation

struct Mission:Codable,Identifiable {
    
    struct CrewRole:Codable{
        let name:String
        let role:String
    }
    
    let id:String
    let launchDate:String?
    let crew:[CrewRole]
    let description:String
    
}


