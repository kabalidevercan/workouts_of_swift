//
//  model.swift
//  mvvmtry
//
//  Created by Ercan Kabali on 6.05.2024.
//

import Foundation



struct Item:Identifiable {
    
    let id:Int
    let commentCount:Int
    let score:Int
    let author:String
    let title:String
    let date:Date
    let url:String
    
    
}

extension Item: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, score, title, url
        case commentCount = "descendants"
        case date = "time"
        case author = "by"
    }
}
