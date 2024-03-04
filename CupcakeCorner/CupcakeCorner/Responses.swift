//
//  Responses.swift
//  CupcakeCorner
//
//  Created by Ercan Kabali on 4.03.2024.
//

import SwiftUI
import Foundation




struct Result:Codable{
    var trackId:Int
    var trackName:String
    var collectionName:String
}


struct Response:Codable{
    var results:[Result]
}



