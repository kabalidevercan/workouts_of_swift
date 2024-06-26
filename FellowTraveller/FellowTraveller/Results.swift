//
//  Results.swift
//  FellowTraveller
//
//  Created by Ercan Kabali on 3.05.2024.
//

import Foundation


struct Result: Codable {
    let query: Query
}

struct Query: Codable{
    let pages : [Int:Page]
}

struct Page : Codable,Comparable{
    let pageId : Int
    let title : String
    let terms : [String : [String]]?
    
    static func <(lhs:Page,rhs:Page) -> Bool {
        lhs.title < rhs.title
    }
    
    var description : String {
        terms?["description"]?.first ?? "No further information"
    }
    
}

