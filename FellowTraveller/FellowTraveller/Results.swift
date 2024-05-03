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

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable,Equatable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
            
}
